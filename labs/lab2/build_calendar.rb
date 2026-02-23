require 'date'
require 'pp'

def parse_cmdline(argv)
  return 'list of arguments' if argv.length < 4

  start_date = Date.strptime(argv[1], '%d.%m.%Y')
  return 'start date' if start_date.nil?

  end_date = Date.strptime(argv[2], '%d.%m.%Y')
  return 'end date' if end_date.nil?

  return 'date range' unless start_date <= end_date

  input_filename = argv[0]
  return 'input file' unless File.exist?(input_filename)

  output_filename = argv[3]
  return 'output file' if File.exist?(output_filename)

  { start_date: start_date, end_date: end_date, input_filename: input_filename, output_filename: output_filename }
end

def read_team_table(filename)
  teams = []
  team_cities = {}
  valid = true
  File.open(filename, 'r') do |f|
    while true
      begin
        ln = f.readline.split('.')
        if ln.length < 2
          valid = false
          break
        end
        tokens = ln[1].split('—')
        if tokens.length < 2
          valid = false
          break
        end
        team_name = tokens[0].strip
        city_name = tokens[1].strip
        teams << team_name
        team_cities[team_name] = city_name
      rescue IOError
        break
      end
    end
  end
  return nil unless valid

  { teams: teams, team_cities: team_cities }
end

def time_slot_count(start_date, end_date)
  days = Integer(end_date - start_date)
  total = 0
  head = (7 - (start_date.wday + 2)) % 7
  total += [0, head - 4].max
  days -= head
  whole_weeks = days / 7
  total += whole_weeks * 3
  tail = days - whole_weeks * 7
  total += [3, tail].min
  total
end

def create_calendar(config, positioned_slots)
  def write_day(date, slots, output_file)
    day_slots = ['12:00', '15:00', '18:00']
    output_file.write "#{date.strftime '%A, %B %e %Y'}\n"
    slots.each_with_index do |slot, i|
      next if slot.nil?

      output_file.write "\t#{day_slots[i]}:\n"
      unless slot.game1.nil?
        output_file.write "\t\tкоманда \"#{slot.game1.team1}\" играет с \"#{slot.game1.team2}\" в городе #{slot.game1.city}\n"
      end
      unless slot.game2.nil?
        output_file.write "\t\tкоманда \"#{slot.game2.team1}\" играет с \"#{slot.game2.team2}\" в городе #{slot.game2.city}\n"
      end
    end
  end

  output_file = File.open(config[:output_filename], mode = 'w')
  first_day = config[:start_date] + (7 - (config[:start_date].wday + 2)) % 7
  curr_day = nil
  curr_day_slots = nil
  positioned_slots.each do |slot|
    day_num = slot[0] / 3
    day_slot_num = slot[0] % 3
    week_num = day_num / 3
    day = first_day + week_num * 7 + day_num % 3
    if curr_day.nil? || day != curr_day
      write_day(curr_day, curr_day_slots, output_file) unless curr_day.nil?
      curr_day = day
      curr_day_slots = [nil, nil, nil]
    end
    curr_day_slots[day_slot_num] = slot[1]
  end
  write_day(curr_day, curr_day_slots, output_file)
  output_file.close
end

config = parse_cmdline(ARGV)
abort 'invalid ' + config if config.is_a?(String)

table = read_team_table(config[:input_filename])

teams = table[:teams]
team_cities = table[:team_cities]

Game = Struct.new('Game', :team1, :team2, :city, :scheduled)
games = []

for a in 0...teams.length
  for b in 0...teams.length
    next if a == b
    next unless a < b || team_cities[teams[a]] != team_cities[teams[b]]

    games << Game.new(teams[b], teams[a], team_cities[teams[b]], false)
  end
end

Timeslot = Struct.new('Timeslot', :game1, :game2)
timeslots = []
n_available_timeslots = time_slot_count(config[:start_date], config[:end_date])

i = 0
j = 0
while i < games.length
  k = j
  scheduled = false
  while k < timeslots.length
    if timeslots[k].game1.nil?
      timeslots[k].game1 = games[i]
      games[i].scheduled = true
    elsif timeslots[k].game2.nil? && timeslots[k].game1.city != games[i].city
      timeslots[k].game2 = games[i]
      games[i].scheduled = true
      scheduled = true
      j += 1 until j >= timeslots.length || timeslots[j].game1.nil? || timeslots[j].game2.nil?
    end
    break if scheduled

    k += 1
  end

  if !scheduled && timeslots.length < n_available_timeslots
    timeslots << Timeslot.new(games[i], nil)
    games[i].scheduled = true
  end

  i += 1
end

position = 0r
increment = Rational(n_available_timeslots) / timeslots.length
positioned_slots = []
timeslots.each do |slot|
  positioned_slots << [position.round, slot]
  position += increment
end

create_calendar(config, positioned_slots)

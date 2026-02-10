# ============================================
# LAB 1: Control Statements in Ruby
# ============================================
# Complete the following exercises to learn Ruby control flow.
# Replace the 'nil' return values with your implementation.
# Run this file with: ruby control_statements.rb

# Exercise 1: If-else statement
# Return "positive" if number > 0, "negative" if < 0, "zero" if == 0
# Expected: check_number(5) => "positive"
def check_number(num)
  if num > 0
    "positive"
  elsif num < 0
    "negative"
  else
    "zero"
  end
end

# Exercise 2: Ternary operator
# Use ternary operator to return "even" or "odd"
# Expected: even_or_odd(4) => "even"
def even_or_odd(num)
  num % 2 == 0 ? "even" : "odd"
end

# Exercise 3: Unless statement (Ruby-specific)
# Return "access granted" unless age is less than 18
# Expected: check_access(20) => "access granted"
# Expected: check_access(15) => "access denied"
def check_access(age)
  unless age < 18
    "access granted"
  else
    "access denied"
  end
end

# Exercise 4: Case statement (switch)
# Return the day type: "weekday" for Mon-Fri, "weekend" for Sat-Sun, "invalid" otherwise
# Expected: day_type("Monday") => "weekday"
def day_type(day)
  case day
  when "Monday","Tuesday","Wednesday","Thursday","Friday"
    "weekday"
  when "Saturday","Sunday"
    "weekend"
  else
    "invalid"
  end
end

# Exercise 5: While loop
# Return an array of numbers from 1 to n
# Expected: count_up(5) => [1, 2, 3, 4, 5]
def count_up(n)
  numbers = []
  i = 0
  while i < n
    numbers << i + 1
    i = i + 1
  end
  numbers
end

# Exercise 6: Until loop (Ruby-specific)
# Return an array counting down from n to 1
# Expected: count_down(5) => [5, 4, 3, 2, 1]
def count_down(n)
  numbers = Array.new
  until n == 0
    numbers << n
    n = n - 1
  end
  numbers
end

# Exercise 7: For loop / each iterator
# Sum all numbers in an array
# Expected: sum_with_loop([1, 2, 3, 4]) => 10
def sum_with_loop(arr)
  sum = 0
  for x in arr
    sum = sum + x
  end
  sum
end

# Exercise 8: Break and next
# Return an array of numbers from array that are < 10, stop at first number >= 20
# Expected: process_numbers([5, 8, 12, 25, 3, 15]) => [5, 8]
def process_numbers(arr)
  processed = []
  for x in arr
    if x >= 20
      break
    end
    if x < 10
      processed << x
    end
  end
  processed
end

# Exercise 9: Modifier if/unless
# Return "big" if number > 100, otherwise return the number itself
# Use if as a statement modifier (at the end of line)
# Expected: check_size(150) => "big"
# Expected: check_size(50) => 50
def check_size(num)
  return "big" if num > 100
  return num
end

# ============================================
# TEST CASES - Do not modify below this line
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  # Test 1
  total_tests += 1
  if check_number(5) == "positive" && check_number(-3) == "negative" && check_number(0) == "zero"
    tests_passed += 1
    puts "✓ Test 1 passed: check_number"
  else
    puts "✗ Test 1 failed: check_number"
  end

  # Test 2
  total_tests += 1
  if even_or_odd(4) == "even" && even_or_odd(7) == "odd"
    tests_passed += 1
    puts "✓ Test 2 passed: even_or_odd"
  else
    puts "✗ Test 2 failed: even_or_odd"
  end

  # Test 3
  total_tests += 1
  if check_access(20) == "access granted" && check_access(15) == "access denied"
    tests_passed += 1
    puts "✓ Test 3 passed: check_access"
  else
    puts "✗ Test 3 failed: check_access"
  end

  # Test 4
  total_tests += 1
  if day_type("Monday") == "weekday" && day_type("Saturday") == "weekend" && day_type("Funday") == "invalid"
    tests_passed += 1
    puts "✓ Test 4 passed: day_type"
  else
    puts "✗ Test 4 failed: day_type"
  end

  # Test 5
  total_tests += 1
  if count_up(5) == [1, 2, 3, 4, 5]
    tests_passed += 1
    puts "✓ Test 5 passed: count_up"
  else
    puts "✗ Test 5 failed: count_up"
  end

  # Test 6
  total_tests += 1
  if count_down(5) == [5, 4, 3, 2, 1]
    tests_passed += 1
    puts "✓ Test 6 passed: count_down"
  else
    puts "✗ Test 6 failed: count_down"
  end

  # Test 7
  total_tests += 1
  if sum_with_loop([1, 2, 3, 4]) == 10
    tests_passed += 1
    puts "✓ Test 7 passed: sum_with_loop"
  else
    puts "✗ Test 7 failed: sum_with_loop"
  end

  # Test 8
  total_tests += 1
  if process_numbers([5, 8, 12, 25, 3, 15]) == [5, 8]
    tests_passed += 1
    puts "✓ Test 8 passed: process_numbers"
  else
    puts "✗ Test 8 failed: process_numbers"
  end

  # Test 9
  total_tests += 1
  if check_size(150) == "big" && check_size(50) == 50
    tests_passed += 1
    puts "✓ Test 9 passed: check_size"
  else
    puts "✗ Test 9 failed: check_size"
  end

  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 All tests passed! (#{tests_passed}/#{total_tests})"
    puts "Outstanding! You've mastered Ruby control flow!"
  else
    puts "Tests passed: #{tests_passed}/#{total_tests}"
    puts "Keep working on the remaining exercises."
  end
  puts "=" * 40
end

# Run the tests
run_tests

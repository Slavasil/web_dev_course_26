# ============================================
# LAB 1: String Operations in Ruby
# ============================================
# Complete the following exercises to learn Ruby string manipulation.
# Replace the 'nil' return values with your implementation.
# Run this file with: ruby strings.rb

# Exercise 1: String concatenation
# Concatenate first_name and last_name with a space in between
# Expected: "John" + "Doe" => "John Doe"
def full_name(first_name, last_name)
  first_name + ' ' + last_name
end

# Exercise 2: String interpolation
# Create a greeting message using string interpolation
# Expected: greet("Alice") => "Hello, Alice! Welcome to Ruby."
def greet(name)
  "Hello, #{name}! Welcome to Ruby."
end

# Exercise 3: String methods
# Convert a string to uppercase and return its length
# Expected: process_string("hello") => ["HELLO", 5]
def process_string(str)
  [str.upcase, str.length]
end

# Exercise 4: String slicing
# Extract the first 3 characters from a string
# Expected: first_chars("Ruby") => "Rub"
def first_chars(str)
  str[0, 3]
end

# Exercise 5: String manipulation
# Replace all occurrences of 'a' with 'o' in a string
# Expected: replace_vowel("banana") => "bonono"
def replace_vowel(str)
  str.gsub('a', 'o')
end

# Exercise 6: Check substring
# Check if a string contains a specific substring (case-insensitive)
# Expected: contains_word?("I love Ruby", "ruby") => true
def contains_word?(text, word)
  text.downcase.include?(word.downcase)
end

# ============================================
# TEST CASES - Do not modify below this line
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  # Test 1
  total_tests += 1
  if full_name('John', 'Doe') == 'John Doe'
    tests_passed += 1
    puts '✓ Test 1 passed: full_name'
  else
    puts '✗ Test 1 failed: full_name'
  end

  # Test 2
  total_tests += 1
  if greet('Alice') == 'Hello, Alice! Welcome to Ruby.'
    tests_passed += 1
    puts '✓ Test 2 passed: greet'
  else
    puts '✗ Test 2 failed: greet'
  end

  # Test 3
  total_tests += 1
  if process_string('hello') == ['HELLO', 5]
    tests_passed += 1
    puts '✓ Test 3 passed: process_string'
  else
    puts '✗ Test 3 failed: process_string'
  end

  # Test 4
  total_tests += 1
  if first_chars('Ruby') == 'Rub'
    tests_passed += 1
    puts '✓ Test 4 passed: first_chars'
  else
    puts '✗ Test 4 failed: first_chars'
  end

  # Test 5
  total_tests += 1
  if replace_vowel('banana') == 'bonono'
    tests_passed += 1
    puts '✓ Test 5 passed: replace_vowel'
  else
    puts '✗ Test 5 failed: replace_vowel'
  end

  # Test 6
  total_tests += 1
  if contains_word?('I love Ruby', 'ruby') == true
    tests_passed += 1
    puts '✓ Test 6 passed: contains_word?'
  else
    puts '✗ Test 6 failed: contains_word?'
  end

  puts "\n" + '=' * 40
  if tests_passed == total_tests
    puts "🎉 All tests passed! (#{tests_passed}/#{total_tests})"
    puts "Great job! You've mastered Ruby strings!"
  else
    puts "Tests passed: #{tests_passed}/#{total_tests}"
    puts 'Keep working on the remaining exercises.'
  end
  puts '=' * 40
end

# Run the tests
run_tests

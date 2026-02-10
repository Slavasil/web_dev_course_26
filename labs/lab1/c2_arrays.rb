# ============================================
# LAB 1: Array Operations in Ruby
# ============================================
# Complete the following exercises to learn Ruby array manipulation.
# Replace the 'nil' return values with your implementation.
# Run this file with: ruby arrays.rb

# Exercise 1: Array creation and access
# Return the first and last elements of an array
# Expected: first_and_last([1, 2, 3, 4]) => [1, 4]
def first_and_last(arr)
  [arr[0], arr[-1]]
end

# Exercise 2: Array methods
# Add an element to the end of an array and return the modified array
# Expected: add_element([1, 2, 3], 4) => [1, 2, 3, 4]
def add_element(arr, element)
  arr << element
  arr
end

# Exercise 3: Array iteration
# Return an array with all numbers doubled
# Expected: double_numbers([1, 2, 3]) => [2, 4, 6]
def double_numbers(arr)
  arr.map { |x| x * 2 }
end

# Exercise 4: Array filtering
# Return only even numbers from an array
# Expected: even_numbers([1, 2, 3, 4, 5, 6]) => [2, 4, 6]
def even_numbers(arr)
  arr.filter { |x| x.even? }
end

# Exercise 5: Array reduction
# Calculate the sum of all numbers in an array
# Expected: sum_array([1, 2, 3, 4]) => 10
def sum_array(arr)
  arr.sum
end

# Exercise 6: Array operations
# Check if an array contains a specific element
# Expected: contains?([:a, :b, :c], :b) => true
def contains?(arr, element)
  arr.include?(element)
end

# Exercise 7: Array sorting
# Sort an array of numbers in descending order
# Expected: sort_desc([3, 1, 4, 1, 5]) => [5, 4, 3, 1, 1]
def sort_desc(arr)
  arr.sort.reverse
end

# Exercise 8: Array range
# Create an array of numbers from start to end (inclusive)
# Expected: number_range(1, 5) => [1, 2, 3, 4, 5]
def number_range(start, finish)
  (start..finish).to_a
end

# ============================================
# TEST CASES - Do not modify below this line
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  # Test 1
  total_tests += 1
  if first_and_last([1, 2, 3, 4]) == [1, 4]
    tests_passed += 1
    puts '✓ Test 1 passed: first_and_last'
  else
    puts '✗ Test 1 failed: first_and_last'
  end

  # Test 2
  total_tests += 1
  result = add_element([1, 2, 3], 4)
  if result == [1, 2, 3, 4]
    tests_passed += 1
    puts '✓ Test 2 passed: add_element'
  else
    puts '✗ Test 2 failed: add_element'
  end

  # Test 3
  total_tests += 1
  if double_numbers([1, 2, 3]) == [2, 4, 6]
    tests_passed += 1
    puts '✓ Test 3 passed: double_numbers'
  else
    puts '✗ Test 3 failed: double_numbers'
  end

  # Test 4
  total_tests += 1
  if even_numbers([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
    tests_passed += 1
    puts '✓ Test 4 passed: even_numbers'
  else
    puts '✗ Test 4 failed: even_numbers'
  end

  # Test 5
  total_tests += 1
  if sum_array([1, 2, 3, 4]) == 10
    tests_passed += 1
    puts '✓ Test 5 passed: sum_array'
  else
    puts '✗ Test 5 failed: sum_array'
  end

  # Test 6
  total_tests += 1
  if contains?(%i[a b c], :b) == true
    tests_passed += 1
    puts '✓ Test 6 passed: contains?'
  else
    puts '✗ Test 6 failed: contains?'
  end

  # Test 7
  total_tests += 1
  if sort_desc([3, 1, 4, 1, 5]) == [5, 4, 3, 1, 1]
    tests_passed += 1
    puts '✓ Test 7 passed: sort_desc'
  else
    puts '✗ Test 7 failed: sort_desc'
  end

  # Test 8
  total_tests += 1
  if number_range(1, 5) == [1, 2, 3, 4, 5]
    tests_passed += 1
    puts '✓ Test 8 passed: number_range'
  else
    puts '✗ Test 8 failed: number_range'
  end

  puts "\n" + '=' * 40
  if tests_passed == total_tests
    puts "🎉 All tests passed! (#{tests_passed}/#{total_tests})"
    puts "Excellent! You've mastered Ruby arrays!"
  else
    puts "Tests passed: #{tests_passed}/#{total_tests}"
    puts 'Keep working on the remaining exercises.'
  end
  puts '=' * 40
end

# Run the tests
run_tests

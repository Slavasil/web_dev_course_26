# ============================================
# LAB 1: Hash Operations in Ruby
# ============================================
# Complete the following exercises to learn Ruby hash manipulation.
# Hashes are key-value pairs (like dictionaries in Python or objects in JS).
# Replace the 'nil' return values with your implementation.
# Run this file with: ruby hashes.rb

# Exercise 1: Hash creation and access
# Create a hash with given keys and values, then return the value for a specific key
# Expected: get_value({ name: "Alice", age: 25 }, :name) => "Alice"
def get_value(hash, key)
  hash[key]
end

# Exercise 2: Hash modification
# Add a new key-value pair to a hash and return it
# Expected: add_pair({ a: 1 }, :b, 2) => { a: 1, b: 2 }
def add_pair(hash, key, value)
  hash[key] = value
  hash
end

# Exercise 3: Hash keys and values
# Return an array of all keys from a hash
# Expected: get_keys({ name: "Bob", age: 30, city: "NYC" }) => [:name, :age, :city]
def get_keys(hash)
  hash.keys
end

# Exercise 4: Hash iteration
# Create a new hash with all values doubled
# Expected: double_values({ a: 1, b: 2, c: 3 }) => { a: 2, b: 4, c: 6 }
def double_values(hash)
  hash.transform_values { |x| x * 2 }
end

# Exercise 5: Hash filtering
# Return a new hash with only pairs where value is greater than threshold
# Expected: filter_by_value({ a: 10, b: 5, c: 15 }, 8) => { a: 10, c: 15 }
def filter_by_value(hash, threshold)
  hash.select { |k, x| x > threshold }
end

# Exercise 6: Hash merging
# Merge two hashes (second hash values overwrite first)
# Expected: merge_hashes({ a: 1, b: 2 }, { b: 3, c: 4 }) => { a: 1, b: 3, c: 4 }
def merge_hashes(hash1, hash2)
  hash1.merge hash2
end

# Exercise 7: Hash existence check
# Check if a hash has a specific key
# Expected: has_key?({ name: "Alice", age: 25 }, :name) => true
def has_key?(hash, key)
  hash.has_key? key
end

# Exercise 8: Working with nested hashes
# Access a value from a nested hash
# Expected: nested_value({ user: { name: "John", age: 30 } }, :user, :name) => "John"
def nested_value(hash, key1, key2)
  hash[key1][key2]
end

# ============================================
# TEST CASES - Do not modify below this line
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  # Test 1
  total_tests += 1
  if get_value({ name: 'Alice', age: 25 }, :name) == 'Alice'
    tests_passed += 1
    puts '✓ Test 1 passed: get_value'
  else
    puts '✗ Test 1 failed: get_value'
  end

  # Test 2
  total_tests += 1
  if add_pair({ a: 1 }, :b, 2) == { a: 1, b: 2 }
    tests_passed += 1
    puts '✓ Test 2 passed: add_pair'
  else
    puts '✗ Test 2 failed: add_pair'
  end

  # Test 3
  total_tests += 1
  result = get_keys({ name: 'Bob', age: 30, city: 'NYC' })
  if result&.sort == %i[name age city].sort
    tests_passed += 1
    puts '✓ Test 3 passed: get_keys'
  else
    puts '✗ Test 3 failed: get_keys'
  end

  # Test 4
  total_tests += 1
  if double_values({ a: 1, b: 2, c: 3 }) == { a: 2, b: 4, c: 6 }
    tests_passed += 1
    puts '✓ Test 4 passed: double_values'
  else
    puts '✗ Test 4 failed: double_values'
  end

  # Test 5
  total_tests += 1
  if filter_by_value({ a: 10, b: 5, c: 15 }, 8) == { a: 10, c: 15 }
    tests_passed += 1
    puts '✓ Test 5 passed: filter_by_value'
  else
    puts '✗ Test 5 failed: filter_by_value'
  end

  # Test 6
  total_tests += 1
  if merge_hashes({ a: 1, b: 2 }, { b: 3, c: 4 }) == { a: 1, b: 3, c: 4 }
    tests_passed += 1
    puts '✓ Test 6 passed: merge_hashes'
  else
    puts '✗ Test 6 failed: merge_hashes'
  end

  # Test 7
  total_tests += 1
  if has_key?({ name: 'Alice', age: 25 }, :name) == true
    tests_passed += 1
    puts '✓ Test 7 passed: has_key?'
  else
    puts '✗ Test 7 failed: has_key?'
  end

  # Test 8
  total_tests += 1
  if nested_value({ user: { name: 'John', age: 30 } }, :user, :name) == 'John'
    tests_passed += 1
    puts '✓ Test 8 passed: nested_value'
  else
    puts '✗ Test 8 failed: nested_value'
  end

  puts "\n" + '=' * 40
  if tests_passed == total_tests
    puts "🎉 All tests passed! (#{tests_passed}/#{total_tests})"
    puts "Fantastic! You've mastered Ruby hashes!"
  else
    puts "Tests passed: #{tests_passed}/#{total_tests}"
    puts 'Keep working on the remaining exercises.'
  end
  puts '=' * 40
end

# Run the tests
run_tests

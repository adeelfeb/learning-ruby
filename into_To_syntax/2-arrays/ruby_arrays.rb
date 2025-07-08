puts "--- 1. Creating Arrays ---"

# Empty array
empty_array = []
puts "Empty array: #{empty_array.inspect}"

# Array with different data types
mixed_array = [1, "hello", true, 3.14, nil]
puts "Mixed array: #{mixed_array.inspect}"

# Array of numbers
numbers = [10, 20, 30, 40, 50]
puts "Numbers array: #{numbers.inspect}"

# Array of strings
fruits = ["apple", "banana", "orange", "grape"]
puts "Fruits array: #{fruits.inspect}"

# Array using %w (word array) - useful for arrays of strings without quotes/commas
# Each word separated by space becomes an element
word_array = %w(red green blue yellow)
puts "Word array (%w): #{word_array.inspect}"

puts "\n" # Add a newline for better readability between sections
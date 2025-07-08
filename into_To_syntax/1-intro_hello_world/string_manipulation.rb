puts "--- 1. Creating Strings ---"

# Single quotes: Plain string, no interpolation or escape sequences (except for \' or \\)
my_string_single = 'Hello, Ruby!'
puts "Single quoted string: #{my_string_single}"

# Double quotes: Allows interpolation and escape sequences
my_string_double = "Hello, Ruby!"
puts "Double quoted string: #{my_string_double}"

# String interpolation (embedding variables/expressions inside a string)
name = "Alice"
greeting = "Hello, #{name}!" # The #{...} evaluates the code inside and inserts the result
puts "String with interpolation: #{greeting}"

# Escape sequences (special characters)
new_line_string = "Line 1\nLine 2" # \n for newline
puts "\nString with newline:\n#{new_line_string}"

tab_string = "Item\tPrice" # \t for tab
puts "String with tab: #{tab_string}"

puts "\n" # Add a newline for better readability between sections
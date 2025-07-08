# ruby_methods.rb

puts "--- 1. Defining a Simple Method ---"

# Define a method named 'greet'
def greet
  puts "Hello there!"
  puts "Welcome to Ruby methods."
end

# Call the 'greet' method
greet
greet # You can call it multiple times

puts "\n"


puts "--- 2. Methods with Parameters ---"

# Method that takes one parameter: 'name'
def personalized_greet(name)
  puts "Hello, #{name}!"
  puts "Nice to meet you."
end

# Call the method with different arguments
personalized_greet("Alice")
personalized_greet("Bob")

puts "\n"

# Method that takes multiple parameters: 'num1' and 'num2'
def add_numbers(num1, num2)
  sum = num1 + num2
  puts "The sum of #{num1} and #{num2} is: #{sum}"
end

# Call the method with different arguments
add_numbers(5, 3)
add_numbers(100, 25)

puts "\n"



puts "--- 3. Methods with Return Values ---"

# Method that calculates sum and returns it
def multiply_numbers(a, b)
  product = a * b
  # The last expression evaluated is 'product', so its value is returned
  product
end

# Call the method and store its return value in a variable
result1 = multiply_numbers(4, 7)
puts "4 * 7 = #{result1}"

result2 = multiply_numbers(10, 2)
puts "10 * 2 = #{result2}"

puts "\n"

# Method using explicit 'return' keyword
def get_status_message(is_active)
  if is_active
    return "User is active." # 'return' immediately exits the method
  else
    return "User is inactive."
  end
  # This line will never be reached if an 'if' or 'else' branch is taken
  puts "This message will not be printed."
end

status1 = get_status_message(true)
puts "Status 1: #{status1}"

status2 = get_status_message(false)
puts "Status 2: #{status2}"

puts "\n"

# Return an array or a hash from a method
def get_user_details(user_id)
  if user_id == 1
    # Returns an array
    ["Alice", "alice@example.com", 30]
  elsif user_id == 2
    # Returns a hash (often preferred for structured data)
    { name: "Bob", email: "bob@example.com", age: 25 }
  else
    nil # Return nil if user not found
  end
end

user1_info = get_user_details(1)
puts "User 1 details (array): #{user1_info.inspect}"

user2_info = get_user_details(2)
puts "User 2 details (hash): #{user2_info.inspect}"
puts "User 2 name: #{user2_info[:name]}"

puts "\n"


puts "--- 5. Variable Number of Arguments (Splat Operator *) ---"

# The *args collects all extra arguments into an array named 'args'
def print_all_items(*items)
  puts "Received #{items.length} items:"
  items.each_with_index do |item, index|
    puts "  #{index + 1}. #{item}"
  end
end

print_all_items("apple", "banana", "orange")
print_all_items(10, 20, 30, 40, 50)
print_all_items("Just one item")
print_all_items # Can be called with no arguments, 'items' will be an empty array

puts "\n"
# Ruby Methods (Functions)

A method in Ruby is a block of code that performs a specific task. You define a method once, and then you can call it multiple times from different parts of your program.

**Key Concepts:**

  * **Definition:** How to create a method.
  * **Parameters (Arguments):** How to pass information into a method.
  * **Return Value:** What a method gives back after it finishes its task.
  * **Calling a Method:** How to execute a method.

To run these examples:

1.  Open a text editor (like VS Code).
2.  Paste the code into a new file (e.g., `ruby_methods.rb`).
3.  Save the file.
4.  Open your terminal, navigate to the directory where you saved the file, and run it using: `ruby ruby_methods.rb`

-----

## 1\. Defining a Simple Method

Methods are defined using the `def` keyword, followed by the method name, and ended with `end`.

```ruby
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
```

**Explanation:**

  * `def greet`: This line starts the definition of a method named `greet`.
  * `puts "Hello there!"` and `puts "Welcome to Ruby methods."`: These are the lines of code that make up the body of the `greet` method.
  * `end`: This keyword signifies the end of the method definition.
  * `greet`: This line is how you *call* or *invoke* the method, making its code execute.

**Expected Output for Section 1:**

```
--- 1. Defining a Simple Method ---
Hello there!
Welcome to Ruby methods.
Hello there!
Welcome to Ruby methods.
```

-----

## 2\. Methods with Parameters (Arguments)

Parameters allow you to pass data into a method, making it more dynamic and reusable.

```ruby
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
```

**Explanation:**

  * `def personalized_greet(name)`: `(name)` defines `name` as a parameter. When `personalized_greet` is called, the value passed to it (e.g., "Alice") will be assigned to the `name` variable within the method's scope.
  * `def add_numbers(num1, num2)`: Defines `num1` and `num2` as parameters.

**Expected Output for Section 2:**

```
--- 2. Methods with Parameters ---
Hello, Alice!
Nice to meet you.
Hello, Bob!
Nice to meet you.

The sum of 5 and 3 is: 8
The sum of 100 and 25 is: 125
```

-----

## 3\. Methods with Return Values

Methods often perform a calculation or process and then **return** a result. In Ruby, the value of the **last expression evaluated** in a method is implicitly returned. You can also use the `return` keyword explicitly.

```ruby
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
```

**Explanation:**

  * `multiply_numbers`: The method calculates `product`. Since `product` is the last expression, its value is implicitly returned.
  * `get_status_message`: Uses `return` explicitly. This is useful when you want to exit the method early based on a condition.

**Expected Output for Section 3:**

```
--- 3. Methods with Return Values ---
4 * 7 = 28
10 * 2 = 20

Status 1: User is active.
Status 2: User is inactive.

User 1 details (array): ["Alice", "alice@example.com", 30]
User 2 details (hash): {:name=>"Bob", :email=>"bob@example.com", :age=>25}
User 2 name: Bob
```

-----

## 4\. Default Parameter Values

You can provide default values for parameters. If an argument is not provided when calling the method, the default value will be used.

```ruby
puts "--- 4. Default Parameter Values ---"

# 'message' has a default value of "Hello"
def say_something(name, message = "Hello")
  puts "#{message}, #{name}!"
end

# Call with default message
say_something("Charlie")

# Call with a custom message
say_something("David", "Good morning")

# Order matters: parameters with default values usually come after required parameters
# def incorrect_order(message = "Hi", name) # This would raise a syntax error
# end

puts "\n"
```

**Explanation:**

  * `message = "Hello"`: Sets "Hello" as the default value for `message`. If `say_something("Charlie")` is called, `message` will be "Hello". If `say_something("David", "Good morning")` is called, `message` will be "Good morning".

**Expected Output for Section 4:**

```
--- 4. Default Parameter Values ---
Hello, Charlie!
Good morning, David!
```

-----

## 5\. Variable Number of Arguments (Splat Operator `*`)

The splat operator `*` allows a method to accept any number of arguments, which are then collected into an array.

```ruby
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
```

**Explanation:**

  * `def print_all_items(*items)`: `*items` means any arguments passed after the required ones (none in this case) will be collected into an array called `items`.

**Expected Output for Section 5:**

```
--- 5. Variable Number of Arguments (Splat Operator *) ---
Received 3 items:
  1. apple
  2. banana
  3. orange
Received 5 items:
  1. 10
  2. 20
  3. 30
  4. 40
  5. 50
Received 1 items:
  1. Just one item
Received 0 items:
```

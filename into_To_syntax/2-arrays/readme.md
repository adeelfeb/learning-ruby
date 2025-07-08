# Ruby Array Iteration with Index and Value

In Ruby, many methods for collections (like arrays and hashes) accept a `block` of code. This block is executed for each element in the collection. The variables inside the pipes `|...|` are the parameters that the method passes to your block for each iteration.


## 1\. The `each_with_index` Method

This is the most direct and common way to iterate over an array and get both the element's value and its index.

**Syntax:** `array.each_with_index do |value, index| ... end`
or `array.each_with_index { |value, index| ... }` (for single-line blocks)

**Order of Parameters:** The `each_with_index` method always passes the **value first**, then the **index**. So, it should be `|value, index|`. While you *could* name them `|a, b|` or `|index, value|` (and it would still work if you consistently used `index` for the first parameter and `value` for the second), it's a very strong convention and best practice to name them `|value, index|` to reflect their actual order.

```ruby
# array_iteration_with_index.rb

puts "--- 1. Using each_with_index ---"

colors = ["red", "green", "blue", "yellow"]

puts "Iterating through 'colors' with .each_with_index:"
colors.each_with_index do |color, index|
  puts "  Index: #{index}, Value: #{color}"
end

puts "\n"

# Example with different data types
mixed_items = ["apple", 123, true, nil, 3.14]
puts "Iterating through 'mixed_items' with .each_with_index:"
mixed_items.each_with_index do |item, idx|
  puts "  Item at index #{idx} is: #{item} (Type: #{item.class})"
end

puts "\n"
```

**Expected Output for Section 1:**

```
--- 1. Using each_with_index ---
Iterating through 'colors' with .each_with_index:
  Index: 0, Value: red
  Index: 1, Value: green
  Index: 2, Value: blue
  Index: 3, Value: yellow

Iterating through 'mixed_items' with .each_with_index:
  Item at index 0 is: apple (Type: String)
  Item at index 1 is: 123 (Type: Integer)
  Item at index 2 is: true (Type: TrueClass)
  Item at index 3 is:  (Type: NilClass)
  Item at index 4 is: 3.14 (Type: Float)
```

-----

## 2\. Using `map.with_index` (or `collect.with_index`)

If you want to transform elements of an array and the transformation depends on both the value and its index, `map.with_index` is perfect. It returns a *new* array with the transformed elements.

**Syntax:** `array.map.with_index do |value, index| ... end`

```ruby
puts "--- 2. Using map.with_index ---"

products = ["Laptop", "Monitor", "Keyboard", "Mouse"]

# Add a serial number based on index (starting from 1)
numbered_products = products.map.with_index do |product, index|
  "#{index + 1}. #{product}" # index + 1 to start numbering from 1
end

puts "Original products: #{products.inspect}"
puts "Numbered products: #{numbered_products.inspect}"

puts "\n"

# Example: Applying a discount based on index (e.g., every 2nd item gets 10% off)
prices = [100, 50, 200, 75, 120]
puts "Original prices: #{prices.inspect}"

discounted_prices = prices.map.with_index do |price, index|
  if (index + 1) % 2 == 0 # Check if it's an even-numbered item (2nd, 4th, etc.)
    (price * 0.90).round(2) # Apply 10% discount and round to 2 decimal places
  else
    price # No discount
  end
end

puts "Discounted prices: #{discounted_prices.inspect}"

puts "\n"
```

**Expected Output for Section 2:**

```
--- 2. Using map.with_index ---
Original products: ["Laptop", "Monitor", "Keyboard", "Mouse"]
Numbered products: ["1. Laptop", "2. Monitor", "3. Keyboard", "4. Mouse"]

Original prices: [100, 50, 200, 75, 120]
Discounted prices: [100, 45.0, 200, 67.5, 120]
```

-----

## 3\. Using `select.with_index` (or `filter.with_index`)

If you want to select elements from an array based on a condition that involves both the value and its index, `select.with_index` is what you need. It returns a *new* array containing only the elements that satisfy the condition.

**Syntax:** `array.select.with_index do |value, index| ... end`

```ruby
puts "--- 3. Using select.with_index ---"

data_points = [10, 5, 20, 15, 30, 25]

# Select elements that are greater than 10 AND their index is even
filtered_data = data_points.select.with_index do |value, index|
  value > 10 && index.even? # index.even? checks if the index is 0, 2, 4, etc.
end

puts "Original data points: #{data_points.inspect}"
puts "Filtered data points (value > 10 AND index is even): #{filtered_data.inspect}"

puts "\n"
```

**Expected Output for Section 3:**

```
--- 3. Using select.with_index ---
Original data points: [10, 5, 20, 15, 30, 25]
Filtered data points (value > 10 AND index is even): [20, 30]
```

*(Explanation: 20 is at index 2 (even), 30 is at index 4 (even). 10 is not \> 10. 15 is \> 10 but at index 3 (odd). 25 is \> 10 but at index 5 (odd).)*

-----

## 4\. Why `|value, index|` and not `|index, value|`?

This is a common point of confusion for beginners.

  * **Convention:** The Ruby core library methods (`each_with_index`, `map.with_index`, `select.with_index`, etc.) are designed to pass the **element's value as the first parameter** to the block, and the **element's index as the second parameter**.
  * **Consistency:** Sticking to this convention (i.e., `|value, index|`) makes your code more readable and understandable to other Ruby developers, as it's what they'll expect.
  * **What happens if you reverse them?** If you write `|idx, item|` and then use `idx` where you expect the item and `item` where you expect the index, your code will behave unexpectedly because the actual values passed by the method will be in the `value, index` order. The variable names `idx` and `item` are just aliases you give to those parameters within the block.

**Bad Practice (but still "works" in terms of syntax, just confusing):**

```ruby
puts "--- 4. (Avoid) Confusing Parameter Names ---"

letters = ["a", "b", "c"]

letters.each_with_index do |index_var, value_var| # Mislabeled!
  # Here, index_var will actually hold the value ("a", "b", "c")
  # And value_var will actually hold the index (0, 1, 2)
  puts "  Value: #{index_var}, Index: #{value_var}"
end

puts "\n"
```

**Expected (Confusing) Output:**

```
--- 4. (Avoid) Confusing Parameter Names ---
  Value: a, Index: 0
  Value: b, Index: 1
  Value: c, Index: 2
```

As you can see, `index_var` is "a" and `value_var` is 0 in the first iteration, which is opposite to what the variable names suggest. Always use `|value, index|` for clarity and correctness.

-----

## When to use Iterators (and why they are "Rails-y")

You'll see these iteration patterns constantly in Ruby on Rails. For instance, when displaying a list of items in a view:

```erb
<% # app/views/products/index.html.erb %>
<h1>All Products</h1>

<% if @products.any? %>
  <ol>
    <% @products.each_with_index do |product, index| %>
      <li>
        <strong><%= index + 1 %>. <%= product.name %></strong> - Price: $<%= product.price %>
        <%= link_to "Show Details", product_path(product) %>
      </li>
    <% end %>
  </ol>
<% else %>
  <p>No products found.</p>
<% end %>
```

Here, `@products` would be an array of `Product` objects fetched from your database in the controller. `each_with_index` allows you to create a numbered list easily.

**Key takeaway:** The `|variable1, variable2|` syntax defines the names of the parameters that the *method* passes into your code block. For `each_with_index` and similar methods, the first parameter is always the element's value, and the second is its index. Master this, and you'll unlock a lot of Ruby's power\!
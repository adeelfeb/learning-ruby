In Ruby, everything is an object, and every object is an instance of a class. Classes serve as blueprints for creating objects (instances). They define the properties (data) and behaviors (methods) that objects of that class will have.

Let's break down Ruby classes with clear explanations and runnable code examples.

-----

# Ruby Classes (Object-Oriented Programming)

A class is a blueprint or a template for creating objects. An object is an instance of a class.

**Key Concepts:**

  * **Class Definition:** How to create a class.
  * **Objects/Instances:** How to create objects from a class.
  * **Instance Variables:** Data unique to each object.
  * **Initialize Method (`initialize`):** The special method used to set up an object when it's created. This is similar to a constructor in other languages.
  * **Instance Methods:** Behaviors (functions) that objects of the class can perform.
  * **Attribute Accessors (`attr_reader`, `attr_writer`, `attr_accessor`):** Convenient ways to create methods for reading and writing instance variables.


## 1\. Basic Class Definition and Creating Objects

```ruby
# ruby_classes.rb

puts "--- 1. Basic Class Definition and Creating Objects ---"

# Define a simple class called 'Dog'
class Dog
  # Class body (methods, instance variables, etc. will go here later)
end

# Create objects (instances) of the Dog class
# This calls the `new` method on the class
dog1 = Dog.new
dog2 = Dog.new

puts "dog1 is an instance of: #{dog1.class}"
puts "dog2 is an instance of: #{dog2.class}"
puts "Are dog1 and dog2 the same object? #{dog1 == dog2}" # false, they are distinct objects

puts "\n"
```

**Explanation:**

  * `class Dog ... end`: This block defines a new class named `Dog`. Ruby class names conventionally start with an uppercase letter.
  * `Dog.new`: This is the standard way to create a new object (or instance) from a class. It calls the `initialize` method internally, if one is defined.
  * `dog1` and `dog2` are now distinct `Dog` objects in memory.

**Expected Output for Section 1:**

```
--- 1. Basic Class Definition and Creating Objects ---
dog1 is an instance of: Dog
dog2 is an instance of: Dog
Are dog1 and dog2 the same object? false
```

-----

## 2\. The `initialize` Method and Instance Variables

The `initialize` method is special. It's automatically called when you create a new object using `Class.new`. It's used to set up the initial state (properties) of the object. Instance variables, which hold this state, begin with an `@` symbol.

```ruby
puts "--- 2. The initialize Method and Instance Variables ---"

class Person
  # The initialize method is automatically called when a new Person object is created
  def initialize(name, age)
    # Instance variables, starting with '@', belong to the specific object
    @name = name
    @age = age
    puts "A new person named #{@name} (age: #{@age}) has been created!"
  end

  # This is an instance method - it operates on the data of a specific object
  def introduce
    puts "Hi, my name is #{@name} and I am #{@age} years old."
  end
end

# Create Person objects, passing arguments to the initialize method
person1 = Person.new("Alice", 30)
person2 = Person.new("Bob", 25)

# Call instance methods on the objects
person1.introduce
person2.introduce

# Trying to access instance variables directly from outside the class will fail without accessors
# puts person1.@name # This would raise a NoMethodError

puts "\n"
```

**Explanation:**

  * `def initialize(name, age)`: This method takes `name` and `age` as parameters.
  * `@name = name` and `@age = age`: These lines create and assign values to **instance variables**. Each `Person` object will have its own `@name` and `@age`.
  * `introduce`: This is an **instance method**. It can access the `@name` and `@age` of the specific `Person` object it's called on.
  * You cannot directly access instance variables (like `@name`) from outside the object by default; you need accessor methods (see next section).

**Expected Output for Section 2:**

```
--- 2. The initialize Method and Instance Variables ---
A new person named Alice (age: 30) has been created!
A new person named Bob (age: 25) has been created!
Hi, my name is Alice and I am 30 years old.
Hi, my name is Bob and I am 25 years old.
```

-----

## 3\. Attribute Accessors (`attr_reader`, `attr_writer`, `attr_accessor`)

These are convenient helper methods that Ruby provides to automatically create getter and setter methods for your instance variables.

  * `attr_reader :variable_name` creates a **getter** method (allows reading the instance variable).
  * `attr_writer :variable_name` creates a **setter** method (allows writing to the instance variable).
  * `attr_accessor :variable_name` creates **both** a getter and a setter method.

<!-- end list -->

```ruby
puts "--- 3. Attribute Accessors ---"

class Book
  # attr_reader creates a method to read @title and @author
  attr_reader :title, :author
  # attr_writer creates a method to set @pages
  attr_writer :pages
  # attr_accessor creates methods to read and write @genre
  attr_accessor :genre

  def initialize(title, author, pages, genre)
    @title = title
    @author = author
    @pages = pages
    @genre = genre
  end

  def book_info
    "\"#{@title}\" by #{@author}, #{read_pages} pages, Genre: #{@genre}"
  end

  # You can also define your own custom getter/setter if more logic is needed
  def read_pages # Custom getter for pages (using attr_writer still provides a basic setter)
    "Approx. #{@pages} pages"
  end
end

book1 = Book.new("The Ruby Way", "Hal Fulton", 800, "Programming")

# Reading attributes using attr_reader (title, author)
puts "Book Title: #{book1.title}"
puts "Book Author: #{book1.author}"
# puts "Book Pages: #{book1.pages}" # This would cause an error without attr_reader :pages

# Accessing custom getter
puts "Book Pages (custom getter): #{book1.read_pages}"

# Writing to an attribute using attr_writer (pages)
book1.pages = 850 # Calls the setter method created by attr_writer :pages
puts "Updated Book Pages (custom getter): #{book1.read_pages}"

# Reading and writing using attr_accessor (genre)
puts "Original Genre: #{book1.genre}"
book1.genre = "Software Development" # Calls the setter created by attr_accessor
puts "New Genre: #{book1.genre}"    # Calls the getter created by attr_accessor

puts "Full Book Info: #{book1.book_info}"

puts "\n"
```

**Explanation:**

  * `attr_reader :title, :author`: Ruby automatically creates `title()` and `author()` methods that return the values of `@title` and `@author` respectively.
  * `attr_writer :pages`: Ruby creates a `pages=(value)` method that sets `@pages = value`. You'd call this like `book.pages = 500`.
  * `attr_accessor :genre`: This is equivalent to doing both `attr_reader :genre` and `attr_writer :genre`.
  * `book1.title` is syntactic sugar for `book1.title()`.
  * `book1.pages = 850` is syntactic sugar for `book1.pages=(850)`.

**Expected Output for Section 3:**

```
--- 3. Attribute Accessors ---
Book Title: The Ruby Way
Book Author: Hal Fulton
Book Pages (custom getter): Approx. 800 pages
Updated Book Pages (custom getter): Approx. 850 pages
Original Genre: Programming
New Genre: Software Development
Full Book Info: "The Ruby Way" by Hal Fulton, Approx. 850 pages, Genre: Software Development
```

-----

## 4\. Class Methods (vs. Instance Methods)

  * **Instance methods** operate on individual objects (`person1.introduce`).
  * **Class methods** (also called static methods in other languages) operate on the class itself, not on an individual object. They are defined using `self.method_name` or `ClassName.method_name`.

<!-- end list -->

```ruby
puts "--- 4. Class Methods ---"

class Calculator
  # Instance method - operates on a Calculator object
  def add(a, b)
    a + b
  end

  # Class method - defined using 'self.'
  # You call this on the class itself: Calculator.subtract
  def self.subtract(a, b)
    a - b
  end

  # Another way to define a class method
  def Calculator.multiply(a, b)
    a * b
  end
end

# Calling an instance method requires creating an object
calc = Calculator.new
puts "Instance method (add): #{calc.add(10, 5)}"

# Calling a class method directly on the class
puts "Class method (subtract): #{Calculator.subtract(10, 5)}"
puts "Class method (multiply): #{Calculator.multiply(10, 5)}"

puts "\n"
```

**Explanation:**

  * `def add(a, b)`: This is an instance method. You need to create a `Calculator` object (`calc = Calculator.new`) to call it (`calc.add(...)`).
  * `def self.subtract(a, b)` and `def Calculator.multiply(a, b)`: These are class methods. You call them directly on the class (`Calculator.subtract(...)`). They don't have access to instance variables (`@...`) unless those variables are class-level instance variables (which is a more advanced topic).

**Expected Output for Section 4:**

```
--- 4. Class Methods ---
Instance method (add): 15
Class method (subtract): 5
Class method (multiply): 50
```

-----

## 5\. Inheritance

Classes can inherit properties and behaviors from other classes. This promotes code reuse and creates a hierarchy. The class that inherits is called the **subclass** (or child class), and the class it inherits from is the **superclass** (or parent class).

```ruby
puts "--- 5. Inheritance ---"

# Superclass
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} makes a sound."
  end
end

# Subclass inherits from Animal using '<'
class Cat < Animal
  def speak # Override the speak method
    "#{name} says Meow!"
  end

  def hunt
    "#{name} is hunting a mouse."
  end
end

class Dog < Animal
  def speak # Override the speak method
    "#{name} says Woof!"
  end
end

animal = Animal.new("Generic Animal")
cat = Cat.new("Whiskers")
dog = Dog.new("Buddy")

puts animal.speak
puts cat.speak # Calls Cat's speak method
puts cat.hunt  # Cat-specific method
puts dog.speak # Calls Dog's speak method

puts "\n"
```

**Explanation:**

  * `class Cat < Animal`: The `<` symbol indicates that `Cat` inherits from `Animal`. This means `Cat` automatically gets all the methods and instance variables defined in `Animal`.
  * **Method Overriding:** Both `Cat` and `Dog` redefine the `speak` method. When `cat.speak` is called, Ruby looks for `speak` in the `Cat` class first. If it finds it, it uses that version. If not, it looks up the hierarchy to `Animal`.

**Expected Output for Section 5:**

```
--- 5. Inheritance ---
Generic Animal makes a sound.
Whiskers says Meow!
Whiskers is hunting a mouse.
Buddy says Woof!
```

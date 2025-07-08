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
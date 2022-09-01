### Classes

class Cat

end

# different objects, obviously
p Cat.new
p Cat.new

# [:taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :methods,
# :singleton_methods, :protected_methods, :private_methods, :public_methods,
# :instance_variables, :instance_variable_get, :instance_variable_set,
# :instance_variable_defined?, :remove_instance_variable, :instance_of?,
# :kind_of?, :is_a?, :method, :public_method, :public_send, :singleton_method,
# :define_singleton_method, :extend, :clone, :to_enum, :enum_for,
# :<=>, :===, :=~, :!~, :nil?, :eql?, :respond_to?, :freeze, :inspect,
# :object_id, :send, :to_s, :display, :class, :frozen?, :tap, :then,
# :yield_self, :hash, :singleton_class, :dup, :itself, :!, :==, :!=,
# :__id__, :equal?, :instance_eval, :instance_exec, :__send__]
# default methods, inherited from Object (?)
p Cat.new.methods

# adding instance methods

class Dog
  def voice
    puts "Bark, I'm a #{self.to_s}"
  end
end

p Dog.new.voice
p Dog.new.voice

# adding instance variables
class Sheep
  def initialize(name, fur_color = 'Black')
    @name = name
    @fur_color = fur_color
    @age = (1..5).to_a.sample
  end

  def voice
    puts "Baa, I'm a #{self.to_s}"
  end

  def print_name
    puts @name
  end

  def fur_color
    @fur_color
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(age)
    @age = age
  end

  # override
  def to_s
    "#{@name} sheep, am of #{@fur_color} color as and is #{@age} years old"
  end
end

wooler = Sheep.new("Wooller")
wooler.print_name
puts wooler.fur_color

puts wooler.to_s
# to_s can be avoided, seems logical

# (!) hacky (!)
# all var symbols
p wooler.instance_variables
#specific var by symbol
p wooler.instance_variable_get(:@age)
# set
wooler.instance_variable_set(:@age, 45)
puts wooler

# using setter
wooler.age = 13
puts wooler

# .attr_reader, .attr_writer, .attr_accessor
class Crow
  # no @ symbol!
  # attr_reader :name, :type
  # attr_writer :name, :type
  # ^^^ can be changed to:
  attr_accessor :name, :type

  def initialize(name: 'default name', type: nil)
    @name = name
    @type = type
  end

  def to_s
    "Crow + #{@name} + #{@type}"
  end
end

jimbo = Crow.new(name: 'jimbo')
puts jimbo
puts jimbo.name
jimbo.name = 'Jimbo'
puts jimbo.name

# self - very logical aka 'this'

# self outside of class
p self # main
p self.class # Object

# access modifiers

class Car
  attr_accessor :brand, :number_of_wheels

  def initialize(brand:, number_of_wheels: 4)
    @brand = brand
    @number_of_wheels = number_of_wheels
  end

  def make_sound
    puts 'bip'
  end
  # ^^^ everything above is public

  # In Ruby, a protected method (or protected message handler) can only respond to a message
  # with an implicit/explicit receiver (object) of the same family. It also cannot respond to
  # a message sent from outside of the protected message handler context.
  #
  # Basically only self, or object of the same Class
  protected
  def protected_make_sound
    puts "bip_protected + #{@brand}"
  end

  # In Ruby, a private method (or private message handler)
  # can only respond to a message with an implicit receiver (self).
  # It also cannot respond to a message called from outside of the
  # private message handler context (the object)
  private
  def private_make_sound
    puts 'bip_private'
  end

  public
  # public again
  def reach_private_bip
    self.private_make_sound
  end

  # public method to test protected_make_sound
  def compare_wheels_make_sound(car)
    if number_of_wheels > car.number_of_wheels
      self.protected_make_sound
    else
      car.protected_make_sound
    end
  end

end

car = Car.new(brand: 'Toyota')

car.make_sound
# car.protected_make_sound # Invalid call to protected method 'protected_make_sound'
# car.private_make_sound # Invalid call to private method 'private_make_sound'
car.reach_private_bip

car_three_tires = Car.new(brand: 'Three Tires Type', number_of_wheels: 3)
car_five_tires = Car.new(brand: 'Five Tires Type', number_of_wheels: 5)

car.compare_wheels_make_sound(car_three_tires)
car.compare_wheels_make_sound(car_five_tires)

## Inheritance

#Object
puts car.class.superclass
#BasicObject
puts car.class.superclass.superclass

# extends == "<"

require_relative 'Animal.rb'
require_relative 'Donkey.rb'
require_relative 'Goat.rb'

donkey = Donkey.new(name: 'Donkey')
goat = Goat.new(name: 'Goat')

donkey.voice
goat.voice

## static vars and methods


class Human
  @@population = 0
  @scientific_name = 'Homo sapiens'

  attr_reader :head

  def self.population
    @@population
  end

  def self.scientific_name
    @scientific_name
  end

  def self.scientific_name=(new_name)
    @scientific_name=new_name
  end

  def self.reset_population(number_of_people = 0)
    @@population = number_of_people
  end

  def initialize
    @@population += 1
    @head = 1
  end
end

george = Human.new
p george.head

jimmy = Human.new
james = Human.new
p "population is #{Human.population}"

Human.reset_population
p "new population is #{Human.population}"

p Human.scientific_name


# diff between @@ and @ on the class level vars
puts '________________________________________'
class Laptop
  @@brand_name = "unknown"
  @number_of_screens = 1

  def self.brand_name
    @@brand_name
  end

  def self.brand_name=(value)
    @@brand_name = value
  end

  def self.number_of_screens
    @number_of_screens
  end

  def self.number_of_screens=(value)
    @number_of_screens = value
  end

end

class MacBook < Laptop

end

# works
p Laptop.brand_name
p Laptop.number_of_screens

p MacBook.brand_name
p MacBook.number_of_screens # nil

# @vars are not inherited, while @@ are inherited
# @ -> instance variable or (!) Class level instance variable (!) in the example above
# @@ Class level variable

# another tricky thing - setting @@ from the child class overrides it in the parant class too
MacBook.brand_name = 'Apple'
p MacBook.brand_name # Apple
p Laptop.brand_name # Apple

### "It's a common idiom in Ruby to track class-level
### data with an instance variable on the class itself"

## This file is getting too big, move to another one -> Classes_more

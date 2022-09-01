### Modules
# aka interfaces

module Runnable
  def run
    puts "#{self} runs"
  end
end

# Logically produces: undefined method `run' for Runnable:Module (NoMethodError)
# Runnable.run

class Zebra
  include Runnable
end

# works
Zebra.new.run

class Sloth
  include Runnable
  # override?
  def run
    puts "#{self} kinda runs"
  end
end

# overridden
Sloth.new.run


## "static"
class Statement

  #this particular self -> class, not an instance
  # can be written as def Statement.print_statement
  def self.print_statement
    puts "static method"
  end

  def print_statement
    puts "instance method"
  end
end

Statement.new.print_statement
Statement.print_statement


## Include vs extend
module Swimmable
  def swim
    puts 'swimming'
  end
end

class Fish
  include Swimmable
end

class Whale
  extend Swimmable
end

# works
# extend  -> everything belongs to the class
# include -> everything belongs to the instance
Whale.swim
Fish.new.swim

# [Fish, Swimmable, Object, Kernel, BasicObject] -> include adds swimmable
p Fish.ancestors

# [Whale, Object, Kernel, BasicObject] -> extend DOES NOT add swimmable
p Whale.ancestors

# undefined method `swim' for Fish:Class (NoMethodError)
# Fish.swim
# undefined method `swim' for #<Whale:0x00007f9b9e0f77b0> (NoMethodError)
# Whale.new.swim

# include adds methods AFTER, meaning module will NOT override the methods
# since instance.swim will be found first
class Boat
  include Swimmable

  def swim
    puts "Boat"
  end
end

# "Boat", NOT "swimming"
Boat.new.swim

## prepend, adds BEFORE
class Ship
  prepend Swimmable

  def swim
    puts "Ship"
  end
end

# "swimming", NOT "Ship"
Ship.new.swim

### Comparable module

# [Numeric, Comparable, Object, Kernel, BasicObject]
p Numeric.ancestors
# [String, Comparable, Object, Kernel, BasicObject]
p String.ancestors

class Furniture
  # need to def <=> method
  include Comparable

  attr_accessor :weight

  def initialize(weight)
    @weight = weight
  end

  def to_s
    "I weight exactly #{@weight} kilos"
  end

  def <=>(other)
    # if self.weight < other.weight
    #   -1
    # elsif self < other
    #   1
    # elsif self ==  other
    #   0
    # end
    self.weight <=> other.weight
  end

end

class Chair < Furniture

end

class Sofa < Furniture

end

chair_heavy = Chair.new(25)
chair_light = Chair.new(10)
sofa = Sofa.new(35)

puts chair_heavy
puts chair_light
puts sofa

# <=> allows these:
puts chair_light == chair_heavy
puts chair_light > chair_heavy
puts chair_light < sofa
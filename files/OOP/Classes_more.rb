# <- Classes.rb
## super keyword


class Game
  attr_reader :players, :started_at

  def initialize(time)
    @started_at = time
  end
end

class Poker < Game
  def initialize(time: Time.now)
    super
    @players = "2-5"
  end
end

class Bowling < Game
  def initialize(time: Time.now)
    super
    @players = "1-8"
  end
end

class Chess < Game
  def initialize(time: Time.now)
    super
    @players = "2"
  end
end
puts '________________________________________'
p Poker.new
p Bowling.new
p Chess.new

# super without the empty parenthesis -> automatically passed the time argument into super call
#  e.g. the same as
# def initialize(time: Time.now)
#   super(time: time)
# and produces: wrong number of arguments (given 1, expected 0) (ArgumentError)
# In Ruby the super call is the only place where it makes sense to call method with empty parenthesis
# as "super()", then it overrides the passed into initialize element and does not pass it into the parent call
#
# When adding the following to Game class super no longer works with the 0 arguments call "super()"
# def initialize(time)
#     @started_at = time
#   end
#
puts '________________________________________'
### Monkey patching
# In Ruby, a Monkey Patch (MP) is referred to as a dynamic modification
# to a class and by a dynamic modification to a class means to add new
# or overwrite existing methods at runtime. This ability is provided by
# ruby to give more flexibility to the coders.

# p Poker.new(time: Time.now - 600.seconds) undefined method `seconds' for 600:Integer (NoMethodError)

class Integer
  # return same int
  def seconds
    self
  end

  def minutes
    seconds * 60
  end

  def hours
    minutes * 60
  end

  def days
    hours * 24
  end
end

# works, Integer now has additional methods
# 15:13:31.639552
p Poker.new(time: Time.now - 600.seconds)
# 15:13:31.639565
p Poker.new(time: Time.now - 10.minutes)
# 13:23:31.639575
p Poker.new(time: Time.now - 2.hours)

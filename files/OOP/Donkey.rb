class Donkey < Animal

  def initialize(name:, fur_color: 'Grey')
    @name = name
    @fur_color = fur_color
    @age = (1..5).to_a.sample
  end

  def print_type
    puts "Donkey"
  end

  # override
  def to_s
    "#{@name} donkey, am of #{@fur_color} color and is #{@age} years old"
  end

  private
  def sound
    'Hee-haw'
  end
end

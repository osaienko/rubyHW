class Goat < Animal

  def initialize(name:, fur_color: 'Black')
    @name = name
    @fur_color = fur_color
    @age = (1..5).to_a.sample
  end

  def print_type
    puts "Goat"
  end

  # override
  def to_s
    "#{self.name} goat, am of #{@fur_color} color and is #{@age} years old"
  end

  private
  def sound
    'Baa'
  end
end

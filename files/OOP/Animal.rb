class Animal
  attr_accessor :name, :fur_color, :age

  def voice
    puts sound
    puts "I'm a #{self.to_s}"
  end
end

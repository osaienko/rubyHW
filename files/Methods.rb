5.times do
  # sleep 1
  p 'Hey!'
end

# request user input, cut off line separator character at the end
1.times { p gets.chomp}

# DOES NOT WORK, name is the counter here, that function 'times' returns
name = 'Ruby'
# (Intellij: Parameter 'name' shadows an outer parameter or local variable )
3.times {|name| puts name}

# same but multiline
2.times do |counter|
  puts counter
end

#WORKS???
def get_name
  'Buggy'
end
# TODO: figure this out
get_name {|string| puts string}

### Methods
def print_number_parity
  number = gets.chomp.to_i
  puts number.even? ? "#{number} is even" : "#{number} is odd"
end

puts 'Hello, username! Please enter 3 numbers and I will check if they\'re even or odd'
print_number_parity
print_number_parity
print_number_parity
puts 'You got this, bye!'

def divide (number_1, number_2)
  # figure out how to die/throw exception, instead of the returns
  return false unless number_1.is_a?(Numeric) && number_2.is_a?(Numeric)
  return false if number_1.nil? || number_2.nil?
  return false if number_2 == 0

  number_1 / number_2
end

puts 'Write 2 numbers and I will divide them'
puts 'Number 1 is:'
num_1 = gets.chomp.to_i
puts 'Number 2 is:'
num_2 = gets.chomp.to_i
division_result = divide(num_1, num_2)

if division_result
  puts division_result
else
  puts 'Are you sure the instructions were properly followed?'
end

#default argument
def sum (a, b = 2)
  puts a + b
end
puts "Let's see if it worked?"
sum(1)

#named arguments
def multiply(num_1:, num_2:)
  num_1 * num_2
end
puts "multiply with named arguments"
puts multiply(num_2: 2, num_1: 5)

#named arguments with default value
def make_magic(num_1:, num_2: 2)
  num_1 == num_2
end
puts "named arguments with default value"
puts make_magic(num_1: 2)
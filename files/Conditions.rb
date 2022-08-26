# very basic stuff here
if true
  p "I'm true"
end

# basic if / else
p "write a number, please"
user_input = gets.chomp.to_i
if user_input > 10
  p "more than 10"
else
  p "less than 10"
end

# same but elsif
p "write another number, please"
user_input = gets.chomp.to_i
if user_input > 10
  p "more than 10"
elsif user_input == 10
  p "that's the 10"
else
  p "less than 10"
end

# Ternary, as usual
user_input == 5 ? p('is a 5') : p('not a 5')
# same as
p user_input == 5 ? 'is a 5' : 'not a 5'

# switch/case

case user_input
when 1
  p "1"
when 2
  p "2"
when 3
  p "3"
else
  p "not 1-3"
end

# unless == if not, just like in Perl

unless false
  p "not false"
end
# or the same thing
p "not false" unless false

# while is the usual suspect
counter = 0
while counter <= 10
  p "counter is " + counter.to_s
  counter += 1
end
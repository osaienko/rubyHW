### Cycles

numbers = [1,2,3,4,5,6,7,8,9,10]

# intellij suggests converting to .each
for number in numbers
  p number
end

# break
for number in numbers
  break if number == 5
  p number
end
# same with .each
numbers.each do |number|
  break if number == 5
  p number
end

# next
numbers.each { |number|
  next if number == 5
  p number
}
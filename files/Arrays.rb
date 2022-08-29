### Arrays

# define basic Array
arr = [1,2,3,4,5]
# [1, 2, 3, 4, 5]
p arr
# 1
# 2
# 3
# 4
# 5
puts arr

# get/set is the regular stuff; arr[0] (arr.first), etc
# arr[-1] - get last (arr.last)
# arr[0..2] is also possible

# NPE does not exist here :)
# nil
p arr[arr.length + 2022]

# another way of creation
arr_2 = Array.new(4)
# [nil, nil, nil, nil]
p arr_2

# second argument fills in all elements in the array
arr_3 = Array.new(4, 'Ruby')
# ["Ruby", "Ruby", "Ruby", "Ruby"]
p arr_3
# In this case it is the same string object!
# changing 0 character in the 0 element changes it for the whole array
arr_3[0][0] = "B"
# ["Buby", "Buby", "Buby", "Buby"]
p arr_3

# array.fetch(index) checks for array out of bounds
# array.fetch(index, "result string") returns the second element instead of failing

# arr.empty? self explanatory

# arr.count('Ruby') - check how many 'Ruby' strings is in the array

# adding new element at the end (both can be chained)
arr.push(4).push(5)
# or
arr << 4 << 5

# add at index 1 element 5 (multiple elements can be passed)
arr.insert(1, 5)

## removing elements
arr.pop # get the last element while also removing it from the array
arr.pop(2) # same, but 2 elements at the end
arr.delete_at(0) # delete at specified index
arr.delete(2) # Removes zero or more elements from self; returns self.

arr = [1,2,3,4,5,6,7]
arr.shift # When no argument is given, removes and returns the first element, just like in Perl :)
arr.shift(2) # same, for 2 elements
arr.unshift(4) # prepend

## comparison
# Can be compared with == and != as usual
# spaceship (<=>) also can be used

## iteration
cats = %w[Ruby Peach Spot Jack Captain] # Intellij: array of string literals ['Ruby', 'Peach', 'Spot', 'Jack', 'Captain']
cats.each { |cat| p cat}
cats.each_index { |index| p index}
cats.each_with_index { |cat, index| p "#{cat} number #{index}"}

cats.reverse # reverse and return a new array
cats.reverse! # returns the string it is called on so (mutates)

# each vs map

characters = %w[Simba Scar Mufasa Timon Pumbaa]

result_each = characters.each { |character| character.upcase }

# ["Simba", "Scar", "Mufasa", "Timon", "Pumbaa"]
p characters
# ["Simba", "Scar", "Mufasa", "Timon", "Pumbaa"]
p result_each

result_map = characters.map { |character| character.upcase }

# ["Simba", "Scar", "Mufasa", "Timon", "Pumbaa"]
p characters
# ["SIMBA", "SCAR", "MUFASA", "TIMON", "PUMBAA"]
p result_map

# The difference between each and map lies in the return value: “each”
# returns its receiver, but “map” returns a new array
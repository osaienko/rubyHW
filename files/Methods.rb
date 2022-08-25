5.times do
  # sleep 1
  p 'Hey!'
end

# request user input, cut off line separator character at the end
1.times { p gets.chomp}

# DOES NOT WORK, name is the counter here, that function 'times' returns
name = 'Ruby'
3.times {|name| puts name}

# same but multiline
2.times do |counter|
  puts counter
end

#WORKS???
def get_name
  'Buggy'
end
# TODO: figure out this
get_name {|string| puts string}
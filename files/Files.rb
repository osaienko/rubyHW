### Working with files

# TODO: why does not work as "../temp/*.txt"?
path = Dir.glob('**/temp/*.txt').first
puts path

# read
# no nil checks here, that's fine for now
File.open(path).each do |line|
  puts line
end

# write (Overrides existing data!)
File.open(path, 'w') do |file|
  file.puts 'additional line'
  file.puts 'and another one'
end

# write without new line characters after each line
File.open(path, 'w') do |file|
  file.write 'additional line'
  file.write 'and another one'
end

# write without overriding (a -> append)
File.open(path, 'a') do |file|
  file.puts 'additional line'
  file.puts 'and another one'
end

# load file with relative path
require_relative 'Files_util.rb'  # load print_gibberish from Files_util.rb
# call loaded method
print_gibberish

# require -> load gems (can load files too, but there is a but)

# require loads only once in a file, if there's code to call right away - it will call it
# load does it every time, not just once


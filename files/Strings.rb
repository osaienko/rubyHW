# don't see much difference here
string_1 = 'string'
p string_1
p string_1.class
string_2 = String.new('another string')
p string_2
p string_2.class

p string_1 + " " + string_2
p string_1 << " " << string_2

multiline_string = <<MLSTRING
1 line
2 line
even more lines
MLSTRING
puts multiline_string

# MLSTRING can be anything
essay = <<LONG_TEXT
lorem
ipsum
LONG_TEXT
puts essay

### Quotes: '' vs ""
single = 'string single'
double = "string double"
p single
p double

# string single\n
single = single+'\n'
# string double
double = double+"\n"
puts single
puts double

# single quotes do not support interpolation (Intellij: "Expression substitution in single-quoted string")
# string single #{1 + 2}
single = 'string single #{1 + 2}'
# string double 3
double = "string double #{1 + 2}"
puts single
puts double

# both can be escaped
single = 'string single \'1\''
double = "string double \"1\""
puts single
puts double

### String comparison
# true
p "String" == "String"
# false (case sensitive)
p "String" == "string"

# string comparison with > or <
# symbol based comparison, where A the biggest and z the smallest
# "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz"
p ('A'..'z').to_a.join

chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz"
# get symbol by position [] or .slice
# first
p chars[0]
# last
p chars[-1]
# second to last
p chars[-2]
# absurdly large number produces nil, not an exception (NPE does not exist in Ruby?)
p chars[15000000]

## Ranges
# 3..5 - from 3 to 5
# 3...5 - from 3 to 5, excluding 5
p chars[1..3]
p chars[1...3]
p (1...6).to_a.join(',')

# Contains
p chars.include?('A')
p "".empty?

# nil check
b = nil
p b.nil?

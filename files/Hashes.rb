### Hash

# create using {} key => value
hash = {'cat_1' => 'Garfield', 'cat_2' => 'Grumpy', 'cat_3' => 'Ruby'}

# access just like in arrays
puts "My cat is: #{hash['cat_3']}"

# can pass default value into new(), it will be used when non existent key is called
empty_hash = Hash.new('default_value')
puts empty_hash['non_existent_key']
# {}, hash stays empty
puts empty_hash

# BUT, modifying the default value modifies it for all future calls
empty_hash['non_existent_key'].upcase! # change original default value
p empty_hash['non_existent_key_2'] # requesting new non-existent key returns changed default value - "DEFAULT_VALUE"

# do the same, but this time initialize default value each time it's called
empty_hash_2 = Hash.new { |hash, key| hash[key] = 'default_value_2'}
puts empty_hash_2['non_existent_key']
empty_hash_2['non_existent_key'].upcase! # default_value_2 -> DEFAULT_VALUE_2 only(!) for 'non_existent_key' key
p empty_hash_2['non_existent_key_2'] # "default_value_2"
p empty_hash_2['non_existent_key'] # "DEFAULT_VALUE_2"

# Symbol
# A symbol is unique because only one instance of
# the Symbol class can be created for a specific
# symbol in a running program Symbols are often compared to strings.
# But the main difference between them relies on the fact that
# a new String object is created for each called string — even if they’re identical

# same strings produce different object IDs here
p 'string'.object_id
p 'string'.object_id

# same id
p :unique.object_id
p :unique.object_id

symbol_hash = {:unique => 'string_1', :unique_2 => 'string_2'}
# {:unique=>"string_1", :unique2=>"string_2"}
p symbol_hash
# better to write as (since Ruby version ?)
symbol_hash_2 = {mega_unique: 'string_1', mega_unique_2: 'string_2'}
# result is same
# {:mega_unique=>"string_1", :mega_unique_2=>"string_2"}
p symbol_hash_2

# can call by the symbol
p symbol_hash_2[:mega_unique] #string_1


user = {
  first_name: 'Sergio',
  last_name: 'Leone',
  height: nil
}

p user[:first_name] # Sergio
p user[:age] # nil, no such key
p user[:height] # nil, actually set to nil
# instead of checking user user.key?(:height) use .fetch
p user.fetch(:age) # produce exception -> key not found: :age (KeyError)
p user.fetch(:height) # nil, actually set to nil

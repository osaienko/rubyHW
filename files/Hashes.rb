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
# p user.fetch(:age) # produce exception -> key not found: :age (KeyError)
p user.fetch(:height) # nil, actually set to nil

p user.length # 3 -> amount of objects, e.g. key/value pairs

p empty_hash.empty? # true

# p Hash.methods to see all methods

# adding to the hash
user[:sex] = 'M' # add or override
p user
# or
user.store(:is_alive, false) # intellij: false -> incompatible type, but it works (?)
p user
# or (!)
user.merge!({ age: nil })
p user


# iteration
user.each do |trait|
  # trait here is an array, each time, with the key in 0, and value in 1
  # e.g. [:first_name, "Sergio"]
  p trait
end

# instead key + value can be used
user.each do |key, value|
  # "the key is first_name and the value is Sergio"
  p "the key is #{key} and the value is #{value}"
end

# iterating over keys
user.each_key do |key|
  # :first_name, :last_name, and so forth
  p key
end

# iterating over values
user.each_value do |value|
  # "Sergio", "Leone", nil, and so forth
  p value
end

# hash as an argument
def i_need_hash(hash)
  hash.each { |elem|
    p elem
  }
end

i_need_hash({
              'key_1' => "value1",
              'key_2' => "value2"
            })

# also can pass without the {}, the result is the same
i_need_hash('key_1' => "value1", 'key_2' => "value2")

# remove a pair
hash_to_modify = {key_1: "value1", key_2: "value2"}
removed_value = hash_to_modify.delete(:key_1) # also returns the removed value
p hash_to_modify #success
p removed_value


# merge, does not change the original one, but returns the result (merge! above)
name = {name: "Clint"}
last_name = {last_name: 'Eastwood'}

user = name.merge(last_name)

# {:name=>"Clint"}
p name
# {:last_name=>"Eastwood"}
p last_name
# {:name=>"Clint", :last_name=>"Eastwood"}
p user

# select
# Returns a new \Hash object whose entries are those for which the block returns a truthy value
# same as hash.filter
shop = {water: 2, coca_cola: 0, rum: 5, orange_juice: 1}

to_refill = shop.select {|product, amount| amount <=1}
# {:coca_cola=>0, :orange_juice=>1}
p to_refill

# anti .select
dont_refill = shop.reject {|product, amount| amount <=1}
# {:water=>2, :rum=>5}
p dont_refill
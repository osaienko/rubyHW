### Blocks

# yield

def this_method_yields
  p "before I yield"
  yield
  p "after I yield"
end

this_method_yields { p 'I yield here'}

# no block given (yield) (LocalJumpError)
# this_method_yields
# to resolve - check:

def this_method_yields_also_checks
  p "before I yield"
  yield if block_given?
  p "after I yield"
end

# no exceptions,
this_method_yields_also_checks

############################################
# variable scope is important!
def yields_with_var
  p "before I yield"
  local_var = 'I\'m a local'
  yield if block_given?
  p "after I yield"
end

# undefined local variable or method `local_var'
# yields_with_var {p local_var}

# can pass into yield block:
def yields_with_var_success
  p "before I yield"
  local_var = 'I\'m a local'
  yield(local_var) if block_given?
  p "after I yield"
end

yields_with_var_success { |passed_var| p passed_var}

# can pass both vars and block

def ultra_yield(var)
  p "before I yield"
  p var
  yield if block_given?
  p "after I yield"
end

# works
ultra_yield('ultra') { p 'another ultra'}

# non-yield

def no_yield_block_call(&block)
  block.call
end

no_yield_block_call {p 'block.call success'}

# pass var into block.call -> block.call(var)
# no block -> same block_given? check


### Proc
# allows to store a block

arr1 = [1,2,3,4,5,6,7,8]
arr2 = arr1.reverse

# same code twice?
p arr1.map { |value| value ** 2}
p arr2.map { |value| value ** 2}

sqrt_proc = Proc.new { |value| value ** 2}

p arr1.map(&sqrt_proc)
p arr2.map(&sqrt_proc)

# works because the Proc has the .call method

# symbol as a proc
# sym.to_proc
# Returns a _Proc_ object which responds to the given method by _sym_.
numbers = [1,2,3,4,5]

# these are the same, call to_s on the passed variable
p numbers.map { |number| number.to_s }
p numbers.map(&:to_s)

# in case of passing the var into a method -> method(var) instead of var.method, the following works
def multiply_by_2(num)
  num * 2
end

# these are the same, pass each variable into method
p numbers.map { |number| multiply_by_2 number }
p numbers.map(&method(:multiply_by_2))

### Lambdas


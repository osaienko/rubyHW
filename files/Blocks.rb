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

def i_accept_block(&block)
  block.call
end

#<Proc:0x00007fe48e05fb48 files/Blocks.rb:113>
proc = Proc.new { puts "I'm a proc"}
#<Proc:0x00007fe48e05f990 files/Blocks.rb:114 (lambda)>
lambda = -> { puts "I'm a lambda"}

# check if lambda?
# lambda.lambda? -> boolean
p proc
p lambda

i_accept_block(&lambda)

# passing arguments
proc_with_args = Proc.new { |a,b| puts "I'm #{a} and also #{b} (proc)"}
lambda_with_args = -> (a,b) { puts "I'm #{a} and also #{b} (lambda)"}

# both return nil, the code works as expected
p proc_with_args.call(1,2)
p lambda_with_args.call(1,2)

# both return nil, not passed param is passed as nil in Proc, but lambda expects all params
p proc_with_args.call(1)
# wrong number of arguments (given 1, expected 2) (ArgumentError)
# p lambda_with_args.call(1)

# return from Proc stops the method, lambda does not do that

def accepts_block_and_puts_stuff(&block)
  puts "method start"
  block.call
  puts "method end"
end


proc_returns = Proc.new do
  puts "proc"
  return
end

lambda_returns = -> do
  puts "lambda"
  return
end


# method start
# proc
# accepts_block_and_puts_stuff(&proc_returns) # commented so that the program does not stop
# method start
# lambda
# method end
accepts_block_and_puts_stuff(&lambda_returns)

## Proc behaves the same way as a block, lambda doesn't
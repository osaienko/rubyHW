### Exceptions
# keyword raise (java throws?)


# raise StandardError if 5 > 4
#
# old way of catching:
#

def method_that_works
  p "I work"
end

def method_that_raises
  p "I throw"
  raise StandardError.new('Custom standard error') if true
end

begin # try
  method_that_works
  method_that_raises
rescue => error # catch
    p error
ensure # finally
  p "basically a finally"
end
# ^^^ error caught

p "after begin"

# custom exception implementation
class MyCustomException < StandardError; end

def method_that_raises_custom
  p "I throw custom"
  raise MyCustomException.new('Custom custom error') if true
end

begin # try
  method_that_works
  # raises properly
  method_that_raises_custom
  # does not raise Standard
  # method_that_raises
rescue MyCustomException => error # catch
  p error
ensure # finally
  p "basically a finally"
end
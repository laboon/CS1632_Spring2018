# Variables act similar to variables in Java.
# In Ruby, though, all variables hold objects.  There are no "primitives" like
# int, char, etc.
# Variables are case-sensitive.  FOO, fOo, and foo are all different variables.
# Variables are generally snake_case (all lowercase, words separated by underscores)
# Use single-equals (=) for assignment, double-equals (==) for comparison

my_name = "Bill" # String
my_age = 38 # Integer
num_children = 1.0 # Float
likes_hoodies = true # TrueClass - Booleans are a little weird in Ruby!

# Ruby is dynamically typed - types are inferred at runtime
# Note there is nothing stopping us from doing this

# This will print out (PUT String) the class of the my_age object
puts my_age.class # Will print out Integer
my_age = "Laboon"

# my_age used to store an Integer, but now it stores a String
# This is actually very dangerous and a common cause of issues in complex
# Ruby programs!  You send an Integer when it expects a Float, for instance.
puts my_age.class # Will now print out String

# Arithmetic operates generally as you expect from Java
a = 1
b = 2
c = 3
puts a + 2 # prints 3
puts b - 2 # prints 0
puts a * b # prints 2
puts c / b # prints 1
# !!!- to force floating point division, make sure you have a Float
# can convert to Float with .to_f
# can convert to Integer with .to_i
puts c.to_f / b # prints 1.5
puts c % 2 # prints 1

# There are no ++ or -- operators - use "a += 1"
# a-- would results in a syntax error
a += 1
puts a # prints 2




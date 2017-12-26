# If statements operate similarly to Java.
# They are checked for truthiness or falsiness.
# Parentheses are optional

bird_age = 18

if bird_age >= 25
  puts "This bird can be elected as a US Representative"
else
  puts "This bird is ineligible to be a US Representative"
end

if (bird_age >= 18)
  puts "This bird can vote"
else
  puts "This bird cannot vote"
end

# Note that this is TRUTHY but not true
# Doesn't matter to Ruby!
if bird_age
  puts "This bird has an age"
else
  puts "This bird is ageless"
end

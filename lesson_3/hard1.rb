# RB101 - Lesson 3: Practice Problems: Hard 1

# -------- question 1 --------
if false
  greeting = “hello world”
end

greeting

# greeting returns nil
# initializing a local variable within an if block is allowed, 
# even if that if block doesn’t get executed, the local variable is initialized to nil.


# -------- question 2 --------
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# assigning a variable to another variable results to: both variables using the same object id
# using "<<" operator will update the value pointing to the same object id. 
# as a result the original variable "greetings" is also updated when the informa_greeting is
# updated using << operator.


# -------- question 3 --------
# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# the reassignments inside the method created new IDs
# thus, variables outside the method are not affected.
# result:
# one is: one
# two is: two
# three is: three

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# just like the result in A)
# the reassignments inside the method created new IDs
# thus, variables outside the method are not affected.

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# gsub! altered the original variables resulting to change in values
# result:
# one is: two
# two is: three
# three is: one


# -------- question 4 --------
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

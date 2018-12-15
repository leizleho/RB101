# RB101 - Lesson 3: Practice Problems: Medium 1

# -------- question 1 --------
# one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right:
#The Flintstones Rock!
# The Flintstones Rock!
#  The Flintstones Rock!

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# -------- question 2 --------
puts "the value of 40 + 2 is " + (40 + 2)
# there is an because + cannot be performed on string and integer
(40 + 2).to_s # =>Solution 1 or
puts "the value of 40 + 2 is #{40 + 2}" # use string interpolation


# -------- question 3 --------
# solution: change the "begin..end until" to "while loop"
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# the purpose of this is to make sure the result of the division has no remainder (integer) 
number % divisor == 0

# the variable factors on the second to the last line is a return value of the method
 

# -------- question 4 --------
# this method mutate the buffer
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# this method does not change the input_array since its value is assigned to new variable buffer
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# -------- question 5 --------
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# The variable limit has to be defined inside the method 
# or it has to be passed as an argument to fib


# -------- question 6 --------
# Original code
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Refactored Code (LS Solution)
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# -------- question 7 --------
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # =>34


# -------- question 8 --------
# Munsters data is changed because is it passed in 
# the mess_with_demographics(demo_hash) method. 
# the demo_hash parameter is changed so it will reflect to the munsters hash.



# -------- question 9 --------
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # =>paper
rps("rock", "paper") # =>paper
rps("rock", "scissors") # =>rock
rps("paper", "rock") # =>paper
rps("paper", "rock") # =>paper


# -------- question 10 --------
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) # => foo return value is yes, bar("yes") will return "no"



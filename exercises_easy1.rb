# Title: Repeat Yourself
# Instruction: Write a method that takes two arguments, 
# a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, number)
    number.times{ puts string }
end





# Title: Odd
# Instruction: Write a method that takes one integer argument, which may be
# positive, negative, or zero. This method returns true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value. 

def is_odd?(number)
  number.abs % 2 != 0
end




# Title: List of Digits
# Instruction: Write a method that takes one argument, 
# a positive integer, and returns a list of the digits in the number.

def digit_list(number)
  list = number.to_s.split('')
  list.map{ |item| item.to_i }
end

def digitlist(number)
  number.to_s.chars.map(&:to_i)
end










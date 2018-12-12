# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
    result = number1.to_i() - number2.to_i()
elsif operator == '3'
result = number1.to_i() * number2.to_i()
else
result = number1.to_f() / number2.to_f()
end 

Kernel.puts("The result is #{result}")

# N O T E S :
# The result variable is initialized within the if condition. Why is it accessbile outside the if condition?
# It is because the if condition does not create a block and variable initialized within it is accessible outside the if condition.


# Launch School - Core Curriculum
## RB101 - Programming Foundations



### Ruby Style 
```
# Naming a file

this_is_a_snake_cased_file.rb

# Assigning a variable

forty_two = 42

# Defining a method

def this_is_a_great_method
  # do stuff
end
```

```
# Constant declaration

FOUR = 'four'
FIVE = 5
```

```
# Multi-line vs single line

[1, 2, 3].each do |i|
  # do stuff
end

[1, 2, 3].each { |i| # do stuff }
```

```
# Class naming

class MyFirstClass
end

class MySecondClass
end
```

Link for more info about Ruby Styling:
[Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide)

### Lesson 2


In lesson 2 (calculator.rb) - we used method "inspect" for inspecting data in Ruby. It returns a string representation of the object.<br>
Here's the code:
```
Kernel.puts("What's the first number?")
number1 = Kernel.gets()
Kernel.puts("the number is: " + number1 + "!")

Kernel.puts(number1.inspect)
```
Output:
```
Leizles-MacBook-Pro:lesson_2 leizleho$ ruby calculator.rb
Welcome to Calculator!
What's the first number?
5
the number is: 5
!
"5\n"
```
As we see, something is wrong with the code because the "!" is printed on the next line. To see what going on behind the code, we use the inspect method on the number1 variable. Now we clearly see that the number1 variable includes a newline character which is the result of user input.

```
# solution to the remove newline character
# perform the chomp method on the user input
number1 = Kernel.gets().chomp()
```


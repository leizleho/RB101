# Launch School - Core Curriculum
## RB101 - Programming Foundations


READ ME FIRST: Some are my own notes but most parts in this notes are copy-paste of lessons from launch school. I'm just putting them here for easy access in case I want to go back to the lessons later on. <br>
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

### Lesson 2: Small Programs


#### Walk-Through: Calculator
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

#### Pseudo-Code
Example of Pseudo-Code: 
```
Given a collection of integers.

Iterate through the collection one by one.
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it's the same
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value.
```
Formalizing pseudo-code a little bit more:

| keyword | meaning |
|---|---|
| START | start of the program |
| SET | sets a variable we can use for later |
| GET | retrieve input from user |
| PRINT | displays output to user |
| READ | retrieve value from variable |
| IF / ELSE IF / ELSE | show conditional branches in logic |
| WHILE | show looping logic |
| END | end of the program |
|

Translating the sample pseudo-code to a formal pseudo-code:
```
START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END
```
Translating Pseudo-Code to Program Code
```
def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end
```


### Lesson 3

#### Looping
Four bacis elements of loop
  a loop
  a counter
  a way to retrieve the current value
  a way to exit the loop.

#### Intro to PEDAC Process

P - Understand the Problem
E - Examples / Test Cases
D - Data Structure
A - Algorithm
C - Code




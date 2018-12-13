# Pseudo-Code Assignments
#### A method that returns the sum of two integers

__Casual Pseudo-code__  
```
Two integers are given as num1 and num2 variables
Assign the sum (num1 + num2) to a new variable sum  
Explicitly return the sum of the integer  
```
__Formal Pseudo-Code__  
 ```
START  
  GIVEN are two integers named num1 and num2
  SET sum = num1 + num2
  RETURN sum
END
```

#### A method that takes an array of strings, and returns a string that is all those strings concatenated together

__Casual Pseudo-code__  
```
Prompt user to enter an array of strings
Retrieve user's input and assign it to a variable arr_string
Initialize a variable concat_string for saving the concatenated string
Iterate through the arr_string, concatenate the string together
Assign the result of concatenated to a variable concat_string
```

__Formal Pseudo-Code__  

```
START
  GET Enter an array of strings
  SET arr_string = user's input
  SET concat_string = concatenated string using #map
  RETURN concat_string
END
```

#### A method that takes an array of integers, and returns a new array with every other element

__Casual Pseudo-Code__  
```
Given an array of integers  
Create/initialize a variable new_array  
Iterate through the array of integers one by one  
  When the index of the array is an odd number save the value to a new array  
Returns the new array
```

__Formal Pseudo-Code__  
```
START
  GET arr  
  SET iterator = 0  
  SET new_arr = nil

  WHILE iterator <= length of arr 
    IF iterator is odd
    SET new_arr = arr[iterator]
    iterator = iterator + 1
    
  RETURN new_arr
END
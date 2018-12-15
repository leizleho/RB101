# RB101 - Lesson 3: Practice Problems: Easy 1

# -------- question 1 --------
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers 
# print out 1 2 2 3. numbers.uniq does not mutate the caller. 
# Adding ! like numbers.uniq will mutate the numbers.


# -------- question 2 --------
# !=  =>means not equal and it is used as comparison operator
# ! before something, like !user_name  =>means NOT
# ! after something, like words.uniq!  =>implies mutation
# ?  =>ternary operator, or just a part of a method name like even?()
# !! before something  =>turn object to their boolean equivalent like !!true==true


# -------- question 3 --------
# replace string
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important','urgent')


# -------- question 4 --------
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)  # =>delete value at index 1, mutate the caller
numbers.delete(1)  # =>delete the value "1", can have more deletion if there 
                   # are more occurence of value 1, mutate the caller


# -------- question 5 --------
(10..100).cover?(42)  # true, 42 is between the begin and end of the range.


# -------- question 6 --------
famous_words = "seven years ago..."
"Four score and " + famous_words 
"Four score and " << famous_words
famous_words.prepend("Four score and ")


# -------- question 7 --------
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# print => add_eight(add_eight(add_eight(add_eight(add_eight(number)))))
eval(how_deep) # =>42


# -------- question 8 --------
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!  # => makes the array unnested


# -------- question 9 --------
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.select { |k, v| k=="Barney"} # => my solution
flintstones.assoc("Barney") # =>LS solution

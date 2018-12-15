# RB101 - Lesson 3: Practice Problems: Easy 2

# -------- question 1 --------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# 3 different ways to see if Spot is present
ages.include?("Spot")
ages.member?("Spot")
ages.key?("Spot")


# -------- question 2 --------
munsters_description = "The Munsters are creepy in a good way."
#convert to this output:
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase


# -------- question 3 --------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)


# -------- question 4 --------
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match?("Dino")


# -------- question 5 --------
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# easier way to write:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# -------- question 6 --------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# add pet Dino
flintstones << ("Dino")


# -------- question 7 --------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# add Dino and Hoppy:
flintstones.push("Dino").push("Hoppy") #or
flintstones.concat(%w(Dino Hoppy))


# -------- question 8 --------
advice = "Few things in life are as important as house training your pet dinosaur."
# remove everything starting from "house"
# return value = Few things in life are as important as
# advice variable = "house training your pet dinosaur."
advice.slice!(0, advice.index('house'))


# -------- question 9 --------
# one-liner to count the number of lower-case 't' characters
# statement = "The Flintstones Rock!"
statement.count('t')


# -------- question 10 --------
title = "Flintstone Family Members"
# center title in 40-character wide table
title.center(40)

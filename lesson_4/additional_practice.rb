# RB101 - Lesson 4: Additional Practice

# -------- practice problem 1 --------
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
flintstones.each_with_index do |names, index|
hash[names] = index
end


# -------- practice problem 2 --------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_ages = 0
ages.each { |_,age| total_ages += age }



# -------- practice problem 3 --------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select { |name, age| age < 100 }



# -------- practice problem 4 --------
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min


# -------- practice problem 5 --------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name[0, 2] == "Be" }


# -------- practice problem 6 --------
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name,index|
  flintstones[index] = name[0, 3]
end
# similar result:
flintstones.map! { |name| name[0,3] }



# -------- practice problem 7 --------
statement = "The Flintstones Rock"
hash = {}
statement.chars do |char|
  next if char == ' '
  if hash.key?(char)
  hash[char] += 1
  else
  hash[char] = 1
  end
end


# -------- practice problem 8 --------

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2


# -------- practice problem 9 --------
words = "the flintstones rock"
words.split.map { |word| word.capitalize }.join(' ')


# -------- practice problem 10 --------
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  case info["age"]
  when 0..18
    info["age_group"] = "kid"
  when 18..65
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end




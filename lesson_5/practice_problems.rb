# RB101 - Lesson 5: Practice Problems

# -------- practice problem 1 --------
arr = ['10', '11', '9', '7', '8']

# my solution:
arr.map { |number| number.to_i }.sort

# LS solution:
arr.sort do |a, b|
  b.to_i <=> a.to_i
end


# -------- practice problem 2 --------
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

#sort books by year
books.sort_by do |book|
  book[:published]
end



# -------- practice problem 3 --------
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# reference the letter 'g'
arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0)


# -------- practice problem 4 --------

# For each of these collection objects where the value 3 occurs, 
# demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0]=4
hsh2[['a']][:a][2] = 4

# -------- practice problem 5 --------
# figure out the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.select { |name, details| details['gender']=='male' }.map do |k,v|
 total_age += v['age']
end

# LS Solution
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end


# -------- practice problem 6 --------
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
end

# -------- practice problem 7 --------
a = 2
b = [5, 8]
arr = [a, b] #[2,[5, 8]]

arr[0] += 2 
arr[1][0] -= a  

# a = 2, b = 3


# -------- practice problem 8 --------
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |val|
  val.each do |str| 
    str.chars { |c| puts c if 'aeiou'.include?c} 
  end
end

# -------- practice problem 9 --------
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |inner_arr|
  inner_arr.sort do |a,b|
    b <=> a
  end
end


# -------- practice problem 10 --------
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hash
  hsh.each do |k,v|
    new_hash[k] = v+1
  end
  new_hash
end


# -------- practice problem 11 --------
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |inner_arr|
  inner_arr.select { |n| n%3 == 0 }
end


# -------- practice problem 12 --------
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
new_hash = {}

arr.each do |sub_arr|
  new_hash[sub_arr[0]] = sub_arr[1]
end 

# -------- practice problem 13 --------
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_arr|
  sub_arr.select { |n| n.odd? }
end


# -------- practice problem 14 --------
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map { |color| color.capitalize }
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end


# -------- practice problem 15 --------
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |key,val|
    val.all? { |item| item % 2 == 0 }
  end
end


# -------- practice problem 16 --------
def generate_uuid
  chars = 'abcdefghijklmnopqrstuvwxyz0123456789'.split('')
  uuid_length = [8,4,4,4,12]
  uuid = ''

  uuid_length.each_with_index do |n,i|
    n.times { uuid << chars.sample }
    uuid << '-' if i < uuid_length.size - 1
  end

  uuid
end



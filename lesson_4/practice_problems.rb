# RB101 - Lesson 4: Practice Problems

# -------- practice problem 1 --------
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# [1, 2, 3] 


# -------- practice problem 2 --------
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# based on ruby-docs
# arr = [1, 2, 4, 2]
# arr.count -> 4  # Returns the number of elements.
# arr.count(2) -> 2  # If an argument is given, counts the number of elements which equal obj using ==.
# arr.count{ |x| x%2 == 0 } -> 3  # If a block is given, counts the number of elements for which the block returns a true value.


# -------- practice problem 3 --------
[1, 2, 3].reject do |num|
  puts num
end

# [1, 2, 3]

# reject returns a new array containing item where the block's return value is false.
# in the reject method above puts num returns nil, therefore, reject returns the item in self.


# -------- practice problem 4 --------
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# ['ant', 'bear', 'cat']


# -------- practice problem 5 --------
hash = { a: 'ant', b: 'bear' }
hash.shift

# [:a, 'ant']
# shift removes the first key-value pair in hash and returns it as [key, value] array



# -------- practice problem 6 --------
['ant', 'bear', 'caterpillar'].pop.size

# 11
# pop destructively removes the last element from the array and returns it.
# the pop method above is chained with the size method 
# so it returns the number of the character of the return value from pop method



# -------- practice problem 7 --------
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# true


# -------- practice problem 8 --------
arr = [1, 2, 3, 4, 5]
arr.take(2)

# [1, 2]
# take(n) returns first n elements from the array
# it is not destructive



# -------- practice problem 9 --------
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# [nil, "bear"]
# the if condition returns nil when it evaluates to false.



# -------- practice problem 10 --------
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# [1, nil, nil]
# puts returns nil for elements > 1.




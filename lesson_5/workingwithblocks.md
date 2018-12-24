# RB101 - Lesson 5: Working with Blocks

##### -------- example 1 --------
 ```
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

line 1 - Array#each method is called on the nested array. Each inner array is passed to the block "do ...end" and assigned to the local variable arr. <br>
line 2 - Array#first method is called on the variable arr which contains inner array. It then returns the object at index 0, in this case 1 and 3 respectively. puts returns nil and since this is the last evaluated statement within the block, the return value of the block is nil. On the other hand, Array#each doesn't do anything with the return value of the block and the its return value is the calling object, in this case it is the nested array and that is what we have on line 6.<br>

##### -------- example 2 --------
```
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```
line 1 - Array#map method is called on the nested array. Each inner array is passed on to the block and assigned to variable arr. 
line 2 - Array#first is called on the variable arr which returns the element at index 0 of the sub-array. The array#first return value is used by the puts. puts output the string representation of the array#first return value. puts itself has a side effect of returning a value of nil and since it is the last evaluated statement and the Array#map method call performs transformation based on the return value of the block, the ultimate result of these three-line code is [nil, nil] <br>

##### -------- example 3 --------
```
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

line 1 - Array#map method is called on the nested array. each inner array is passed to the block and get assigned to variable arr. <br>
line 2 - Array#first method is called on the variable arr which returns the element at index 0. puts output the string representation of the arr.first return value.
line 3 is same as line 2 without the puts. it is the last evaluated statement within the block, so it is the return value of the block. Since map return value is based on the return value of the block, line 3 will be the return value of the map which is [1, 3]



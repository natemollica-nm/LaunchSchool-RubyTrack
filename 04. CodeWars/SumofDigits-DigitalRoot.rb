=begin
    16  -->  1 + 6 = 7
   942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

Given n, take the sum of the digits of n. If that value has more than 
  one digit, continue reducing in this way until a single-digit number is 
  produced. The input will be a non-negative integer.
=end

def digital_root(n)
  if n.to_s.chars.count > 1
    new_n_sum = n.to_s.chars.map {|int| int.to_i}.sum
    digital_root(new_n_sum)
  else
    n
  end
end

input1 = 16
input2 = 942
input3 = 132189
input4 = 493193
test_inputs = [input1, input2, input3, input4]
puts test_inputs.map {|input| digital_root(input) }.join(',')



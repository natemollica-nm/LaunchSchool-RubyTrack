# Take input from user (int) and convert to binary.
# Count only the ones from the binary output and return the number to user.
# Uses .to_s (to string method) with a (2) invocation indicating base 2.
def count_bits(num)

  n = num.to_s(2)
  ones = n.delete("0")
  number_of_ones = ones.length

  puts "The number #{num} has #{number_of_ones} ones in it."
end

puts "Input your number to count the binary digits: "
  user_input = gets.chomp.to_i

  user_input = user_input < 0 ? (user_input = user_input * -1) : (user_input = user_input)

count_bits(user_input)

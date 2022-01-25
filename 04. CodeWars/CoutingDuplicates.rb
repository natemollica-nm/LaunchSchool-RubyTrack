=begin
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end
def duplicate_count(text)
  text.downcase!
  dups = text.chars.map { |char| text.count(char) > 1 ? char : nil}.compact
  if dups.count == 0
    return 0
  elsif dups.count > 0
    count = dups.uniq.map {|unique_char| dups.count(unique_char)}
    return count
  end
end

input1 = "abcde"
input2 = "aabbcde"
input3 = "aabBcde"
input4 = "indivisibility"
input5 = "Indivisibilities"
input6 = "aA11"
input7 = "ABBA"
inputs = [input1,input2,input3,input4,input5,input6,input7]
inputs.each {|input| p duplicate_count(input)}
# Implement the function unique_in_order which takes as 
#   argument a sequence and returns a list of items 
#   without any elements with the same value next to 
#   each other and preserving the original order of 
#   elements.
# Example:
# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
  uniq_arr = []
  i = 1
  if iterable.class == String
    iterable.chars.map { |char| 
      if (iterable.chars[i] != iterable.chars[i-1]) && (uniq_arr.count(char) < 1)
        uniq_arr << char
      end
    }
  else
    iterable.map { |char| uniq_arr << char if (iterable[i] != iterable[i-1]) && (uniq_arr.count(char) < 1)}
  end
  uniq_arr
end

string = 'AAAABBBCCDAABBB'
string2 = 'ABBCcAD'
array = [1,2,2,3,3]

p unique_in_order(string)
p unique_in_order(string2)
p unique_in_order(array)
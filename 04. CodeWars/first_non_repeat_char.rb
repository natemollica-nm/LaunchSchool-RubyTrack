# Write a function named first_non_repeating_letter that 
#   takes a string input, and returns the first character 
#   that is not repeated anywhere in the string.
# For example, if given the input 'stress', the function 
#   should return 't', since the letter t only occurs 
#   once in the string, and occurs first in the string.
# As an added challenge, upper- and lowercase letters are
#  considered the same character, but the function should 
#   return the correct case for the initial letter. For 
#   example, the input 'sTreSS' should return 'T'.
# If a string contains all repeating characters, it should 
#   return an empty string ("") or None -- see sample tests.

def  first_non_repeating_letter(s) 
  nonrepeats_indx = []
  s.downcase.chars.each_with_index { |char, i| return s.chars[i] if s.downcase.chars.count(char) == 1 }
  return ""
end
=begin # Better solution
def  first_non_repeating_letter(s) 
  s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
end
=end

# Main Testing
string = "stress"
case_string = "sTreSS"
all_repeats = "SssssSS"
p first_non_repeating_letter(string)
p first_non_repeating_letter(case_string)
p first_non_repeating_letter(all_repeats)
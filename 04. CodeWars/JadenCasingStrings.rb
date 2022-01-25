class String
  def toJadenCase
    self.split(' ').map { |word| word.capitalize}.join(' ')
  end
end
string = "How can mirrors be real if our eyes aren't real"
puts string
puts string.toJadenCase
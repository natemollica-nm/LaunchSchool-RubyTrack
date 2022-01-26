a = %w(a b c d e)
puts a.fetch(7) # => Outside of bounds at index 7 error
puts a.fetch(7, 'beats me') # => returns "beats me"
puts a.fetch(7) { |index| index**2 } # => returns 49 as the block uses the index as the param to process as index^2
=begin
The documentation for the Date class can be found in the Standard library API documentation. 
  It's not the easiest documentation to use, but for this particular problem, it's easy to 
    look up the civil method.

You can also use the new method instead of civil. However, if you try to read the documentation 
  for new, you will probably walk away feeling unenlightened. Instead, use the civil method.

The documentation for Date::civil (note that it is a class method) shows that its signature is:

civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date

This signature uses [] to show that all of the arguments are optional. This is only a documentation 
  convention; the brackets should not be included in your program.

Note that the brackets are nested with this method; items inside the outermost bracket pairs can only 
  be omitted if all of the innermost bracket pairs are omitted as well. Hence, if you omit the month argument, 
    you must omit mday and start, but you must supply year. From this signature, then, we can see that arguments 
      to civil can be supplied in 5 different ways:
=end
require 'date'

puts Date.civil # Returns date object denoting given calendar date using BCE (Before Common Era) years. BCE is in reference to year 1 (i.e. before the year 1)
puts Date.civil(2016) # Returns DateTime object with the year of 2016, with default of January 1st (i.e. no month or day inputs)
puts Date.civil(2016, 5) # Returns DateTime object with the year of 2016, month of May, with default of 1st of May (i.e. day inputs)
puts Date.civil(2016, 5, 13) # Returns DateTime object with the year of 2016, month of May, on the 13th day (year, month, day inputs provided).
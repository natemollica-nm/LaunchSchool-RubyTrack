=begin
Build a command line calculator program that does the following:
  1. asks for two numbers
  2. asks for the type of operation to perform:
      add, subtract, multiply or divide
  3. displays the result

  Use the Kernel.gets method to retrieve user input,
    and use Kernel.puts method to
      display output. Remember that Kernel.gets includes
       the newline, so you have to
        call chomp to remove it: Kernel.gets.chomp.

Nate's learning notes:
1. Kernel is like the main library for Ruby basic functions.
2. Certain method calls do not need () for invocation.
3. ALL ruby objects (since all Ruby data types are objects) have an inspect()
    method you can use to inspect the data of the object.
4. gets vs gets.chomp (Entry = 3 --> gets => 3\n; gets.chomp => 3) ----> Chomp
    removes whitespace character.
5. Kernel.gets returns String
6. Kernel.chomp returns String
7. Don't .to_i immediately at gets because of the potential to need either an
    integer or float later on. Determine in if/else
8. Local variables initialized within an
    if/else or case can be accessed outside of the if.
=end

Kernel.puts('Welcome to Calculator!')
Kernel.puts('What\'s the first number?')
number_one = Kernel.gets.chomp
Kernel.puts("First #: #{number_one}!")
Kernel.puts('What\'s the second number?')
number_two = Kernel.gets.chomp
Kernel.puts("Second #: #{number_two}!")

Kernel.puts('What operaiton would you like to perform? 1)
  add 2) subtract 3) multiply 4) divide')
operator = Kernel.gets.chomp

case operator
when '1'
  operation = 'Add'
when '2'
  operation = 'Subtract'
when '3'
  operation = 'Multiply'
when '4'
  operation = 'Divide'
end

Kernel.puts("Operation: #{operation}")
if operator == '1'
  result = number_one.to_i + number_two.to_i
elsif operator == '2'
  result = number_one.to_i - number_two.to_i
elsif operator == '3'
  result = number_one.to_i * number_two.to_i
elsif operator == '4'
  result = number_one.to_i / number_two.to_f
else
  puts 'Invalid input!'
end

Kernel.puts("The result is #{result}!")

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
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# ========= Start: Program Function Definitions ========= #
def prompt(message) # Function to better prompt user messages during program use.
  Kernel.puts("=> #{message}")
end

def clear() # Function to clear console.
  system('clear') || system('cls')
end

def valid_number?(num) # Function to validate user num input does not contain a letter.
  (num.to_i != 0) && (num.to_f != 0) && (not num.each_char.any?(/\A[a-zA-Z'-]*\z/))
end

# ========= Start: Program Var Declaration ========= #
name = ''
number_one = ''
number_two = ''
operator = ''
op_hash = { 
  :'1' => 'Adding',
  :'2' => 'Subtracting',
  :'3' => 'Multiplying',
  :'4' => 'Dividing' 
}

# ========= Start: User Welcome and Name Input Retrieval ========= #
prompt(MESSAGES['welcome'])
# Retrieve user's name and validate
loop do
  name = Kernel.gets.chomp
  if name.empty?() || (name.each_char.any?(/\d/))
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

# Mutate name to capitalize first, middle, and last (middle and last optional)
name = name.split(' ').map {|nme| nme.capitalize!}.join(' ')
clear()

# ========= Start: Main Program (Main Loop) ========= #
prompt("Hello #{name}!")

loop do
  # Retrieve and validate first number input.
  loop do
    prompt('What\'s the first number?')
    number_one = Kernel.gets.chomp
    if valid_number?(number_one)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  # Retrieve and validate second number input.
  loop do
    prompt("First #: #{number_one}!")
    prompt('What\'s the second number?')
    number_two = Kernel.gets.chomp
    if valid_number?(number_two)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end
  clear()

  prompt("First #: #{number_one}!")
  prompt("Second #: #{number_two}!")
  # Special string representation using '<<-<ABC>' ==> <ABC> can be any letters as long as closing statement is the same.
  operator_prompt = MESSAGES['operator_prompt']

  # Prompt User for desired operation to perform.
  prompt(operator_prompt)
  
  # Retrieve and validate user desired operation.
  loop do
    operator = Kernel.gets.chomp
    if %(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end
  clear()

  # Retrieve message verb for user's desired operation.
  operation = op_hash[operator.to_sym]
  case operator # Case statement to perform user's desired operation.
  when '1'
    prompt("#{operation}..."); sleep 1
    prompt("Result: #{number_one} + #{number_two} = #{number_one.to_i + number_two.to_i}!")
  when '2'
    prompt("#{operation}..."); sleep 1
    prompt("Result: #{number_one} - #{number_two} = #{number_one.to_i - number_two.to_i}!")
  when '3'
    prompt("#{operation}..."); sleep 1
    prompt("Result: #{number_one} x #{number_two} = #{number_one.to_i * number_two.to_i}!")
  when '4'
    prompt("#{operation}..."); sleep 1
    prompt("Result: #{number_one} / #{number_two} = #{number_one.to_i / number_two.to_f}!")
  end

  # Prompt user to continue to use Calculate application.
  prompt(MESSAGES['continue_prompt'])
  answer = Kernel.gets.chomp

  # Break the loop statement unless user input starts with letter 'y'.
  break unless answer.downcase.start_with?('y')
end
# Display goodbye message to user.
prompt("Goodbye #{name}!")

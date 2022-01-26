# In this assignment, we'll build a Rock Paper Scissors game.
#    The game flow should go like this:
#     1. the user makes a choice
#     2. the computer makes a choice
#     3. the winner is displayed

VALID_CHOICES = %w(rock paper scissors)
name = ''
choice = ''

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Congratulations! You won!")
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt('It\'s a Tie!')
  end
end

def valid_name?(name)
  !(name.empty?() || (name.each_char.any?(/\d/)))
end

loop do
  prompt('Welcome to Rock, Paper, Scissors! Please enter your name:')
  name = gets.chomp
  if valid_name?(name)
    name = name.split(' ').map(&:capitalize!).join(' ')
    break
  else
    prompt('Invalid name entry. Please try again...')
  end
end
loop do
  loop do
    prompt("#{name} ==> Choose One: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Not a valid choice!')
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt('Waiting for computer\'s decision...')
  sleep 1

  display_results(choice, computer_choice)

  prompt("#{name} => #{choice}; Computer => #{computer_choice}")

  prompt('Would you like to play again? (y / n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Rock, Paper, Scissors! Goodbye #{name}!")

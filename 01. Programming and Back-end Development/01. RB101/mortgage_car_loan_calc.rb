=begin
  Take everything you've learned so far and build a mortgage calculator
    (or car payment calculator -- it's the same thing).

  You'll need three pieces of information:
    1. the loan amount
    2. the Annual Percentage Rate (APY)
    3. the loan duration

  From the above, you'll need to calculate the following things:
    1. monthly interest rate
    2. loan duration in months
    3. monthly payment

  Mortage Formula:
    m = p * (j / (1 - (1 + j)**(-n)))
      m = monthly payments
      p = loan amount
      j = monthly interest rate
      n = loan duration in months

  Hints:
    1. Figure out what format your inputs need to be in.
        For example, should the interest rate be expressed as 5 or .05,
          if you mean 5% interest?
    2. If you're working with Annual Percentage Rate (APY), you'll need to
        convert that to a monthly interest rate.
    3. Be careful about the loan duration --
        Are you working with months or years?
        Choose variable names carefully to assist in remembering.

=end
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# ========= START: Variable Declaration =========
name = ''
monthly_payment = 0.0
loan_amount = 0.0
apy = 0.5
loan_dur = 0
loan_dur_hash = {
  '1': 12,
  '2': 24,
  '3': 36,
  '4': 48
}
# ========= END: Variable Declaration =========

# ========= START: Program Function Defs =========

def calc_mortgage(loan_total, apy, duration)
  apr = (apy.to_f / 100.0) / 12
  loan_total = loan_total.tr(',', '').to_f.round(2)
  loan_total * (apr / (1 - (1 + apr)**(duration * -1)))
end

# Function to better prompt user messages during program use.
def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear # Function to clear console.
  system('clear') || system('cls')
end

# Function to validate user num input does not contain a letter.
def valid_number?(num)
  (num.to_i != 0) && (num.to_f != 0) && (!num.each_char.any?(/\A[a-zA-Z'-]*\z/))
end

def valid_percentage?(percentage)
  (percentage.to_f != 0) && (!percentage.each_char.any?(/\A[a-zA-Z'-]*\z/))
end

def valid_name?(name)
  name.empty?() || (name.each_char.any?(/\d/))
end

def number_to_currency(num)
  "$" + num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end
# ========= END: Program Function Defs =========

# ========= START: Name Retrieval ========= #
prompt(MESSAGES['loan_welcome'])
# Retrieve user's name and validate
loop do
  name = Kernel.gets.chomp
  if valid_name?(name)
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end
# Mutate name to capitalize first, middle, and last (middle and last optional)
name = name.split(' ').map(&:capitalize!).join(' ')
clear()
# ========= END: Name Retrieval ========= #

# ========= START: Main Program (Main Loop) ========= #
prompt("Hello #{name}!
  Let's go through some questions regarding your loan.")
loop do
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt[MESSAGES['invalid_num']]
    end
  end
  loop do
    prompt(MESSAGES['loan_apy'])
    apy = gets.chomp
    if valid_percentage?(apy)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end
  loop do
    prompt(MESSAGES['loan_dur'])
    loan_dur = gets.chomp
    if %w(1 2 3 4).include?(loan_dur)
      loan_dur = loan_dur_hash[loan_dur.to_sym]
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end
  clear()
  monthly_payment = calc_mortgage(loan_amount, apy, loan_dur).round(2)
  prompt("Loan Conditions Entered:\n
    Amount: #{number_to_currency(loan_amount.tr(',', ''))}\n
    APY: #{apy}%\n
    Loan Duration: #{loan_dur} Months
    ")
  prompt("#{name}'s Estimated Monthly Payment:
    #{number_to_currency(monthly_payment)}")
  prompt(MESSAGES['continue_prompt'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Exiting mortage loan calculator! Thank you #{name}!")

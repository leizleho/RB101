require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
LANG = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANG)
  puts "=> #{message}"
end

def valid?(input)
  (input.to_i.to_s == input || input.to_f.to_s == input) && input.to_f > 0
end

def calculate_monthly_payment(amount, apr, duration_years)
  duration_months = duration_years.to_f * 12
  monthly_interest_rate = apr.to_f / 100.0 / 12.0
  amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-duration_months))
end

prompt('welcome')

loop do # main loop
  amount = ''
  loop do
    prompt('amount')
    amount = gets.chomp

    if valid?(amount)
      break
    else
      prompt('invalid_amount')
    end
  end

  apr = ''
  loop do
    prompt('apr')
    apr = gets.chomp

    if valid?(apr)
      break
    else
      prompt('invalid_apr')
    end
  end

  duration_years = ''
  loop do
    prompt('duration_years')
    duration_years = gets.chomp

    if valid?(duration_years)
      break
    else
      prompt('invalid_duration')
    end
  end

  monthly_payment = calculate_monthly_payment(amount, apr, duration_years)

  puts "Your monthly payment is: $#{format('%02.2f', monthly_payment)}"

  prompt('calculate_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # main loop

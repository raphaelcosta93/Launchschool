def prompt(message)
  puts("=>#{message}")
end

loop do # main loop
  prompt("Welcome to the Calculator!")
  prompt("--------------------------")

prompt("What's your loan amount?")

amount = nil
loop do # loan amount loop
  amount = gets.chomp

  if amount.empty? || amount.to_f < 0
    prompt("Must be a positive number.")
  else
    break
  end
end

prompt("What is the interest rate?")
prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

interest_rate = nil
loop do # interest rate loop
  interest_rate = gets.chomp

  if interest_rate.empty? || interest_rate.to_f < 0
    prompt("Must be a positive number.")
  else
    break
  end
end

prompt("Whats is the loan duration (in years)?")

years = nil
loop do # duration loop
  years = gets.chomp

  if years.empty? || years.to_f < 0
    prompt("must be a positive number")
  else
    break
  end
end

annual_interest_rate = interest_rate.to_f() / 100
monthly_interest_rate = annual_interest_rate / 12
months = years.to_i() * 12

monthly_payment = amount.to_f() *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-months)))

prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

prompt("Another calculation?")
answer = gets.chomp

break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
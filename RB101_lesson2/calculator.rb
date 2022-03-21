def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
prompt("=Welcome to the calculator! Enter your name:")

name = nil
loop do # main loop
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name.")
      else 
      break
    end
  end

  prompt("Hi #{name}!")

  loop do #number 1 loop

  number1 = nil
  number2 = nil
  loop do
  prompt("=What's the first number ?")
  number1 = gets.chomp

  if valid_number?(number1)
    break
  else
    prompt("Hmm... That doesn't look like a valid number?")
    end
  end

  loop do # number 2 loop
  prompt("=What's the second number ?")
  number2 = gets.chomp
  if valid_number?(number2)
    break
  else
    prompt("Hmm... That doesn't look like a valid number?")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform
  1 add
  2 subtract
  3 multiply
  4 divide
  MSG
  prompt(operator_prompt)


  operator = nil
  loop do #operator loop
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
    break
      else
        prompt("must choose 1, 2, 3, 4")
    end
  end 

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =case operator
  when'1'
    result = number1.to_i + number2.to_i
  when'2'
    result = number1.to_i - number2.to_i
  when'3'
    result = number1.to_i * number2.to_i
  when'4'
    result = number1.to_f / number2.to_f
  end

  prompt"the result is #{result}"

  prompt("do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with? ('y')
  end

  prompt("thank you for using the calculator !")
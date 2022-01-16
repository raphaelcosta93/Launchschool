puts "Please provide a number"
number=gets.chomp.to_i

if number < 0
  puts ("You can't provide a negative number")
elsif number <= 50
  puts ("#{number} Your number is in between or equal 0 and 50")
elsif number <= 100
  puts ("#{number}Your number is in between or equal to 51 and 100")
else number > 100
  puts ("#{number} is greater then 100")
end

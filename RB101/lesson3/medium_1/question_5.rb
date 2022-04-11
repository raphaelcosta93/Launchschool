# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in 
# two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. 
# Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num,variable)
  while first_num + second_num < variable
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1,limit)
puts "result is #{result}"

# How would you fix this so that it works?

# The problem is the scope of the method fib, you can only use variables on a method if the 
# variable was created inside of the method or if the variable is passed as argument.

# This can easily be fixed if the limit method is created inside of the method, " This could
# solve this issue with this small code, but could create some further issues if we had a 
# bigger program that could possibly need the variable limit", so the best way to fix this issue
# is to add another parameter to the method and use  the variable as argument.

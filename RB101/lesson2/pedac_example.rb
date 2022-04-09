# Implement a method that calculates the sum of the integers inside a string. Only positive integers will be tested. E.g. "L12aun3ch Sch3oo45l"

def sum_of_integers(string)
  sum = 0                       #variable with an integer 0
  current_number = ''           #variable with empty string that we will add value to it
  chars = string.chars          #variable with the argument.chars(to return an array of strings)
    chars.each do |char|          #block to iterate through the argument
    if ('0'..'9').include?(char)#checking if 0..9 in the argument if inside shovel to current_number
      current_number << char    #adding iteration to the empty string current_number
          else
      sum += current_number.to_i# sum = (sum +current_number).to_i
      current_number = ''       #setting the variable current_number back to a empty string
    end
  end
  sum  #+ current_number.to_i   #making sure the variable sum has the new value.
end



p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD77!") == 77
p sum_of_integers("HELLO WORLD77")  == 77
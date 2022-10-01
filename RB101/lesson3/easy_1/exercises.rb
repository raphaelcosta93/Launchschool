=begin
write a method that takes one string and returns the middle character of the string
when the character has a even size return 2 characters when odd size return 1 character

example provided

data structure string

algorithm
write a method
create a empty string called result
create a half_size variable that is the argument size divided by 2
iterate through the argument using select and select the half character if the character size
is odd or select two characters if the argument size is even and add to the string results
return the result variable
=end

def center_of(words)
  result = ''
  half = words.size / 2

  if words.size.odd?
    result << words[half]
  else
    result << words[half - 1, 2]
  end
  result
end




p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
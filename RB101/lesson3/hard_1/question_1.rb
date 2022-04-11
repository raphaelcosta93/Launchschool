# What do you expect to happen when the greeting variable is referenced in the last line of the 
#   code below?

if false
  greeting = "hello world"
end

greeting

#undefined method or local variable, this happens because usually will raise an error
#saying that the variable it's undefined, however when you initialize a variable with a 
#if block if the if block doesn't get executed the local variable is initialized to nil.
#and the if conditition it's not executed , because in ruby everything is considered
#to be truthy unless explicit says is yes or nil.

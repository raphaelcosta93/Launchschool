# How could the following method be simplified without changing its return value?

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

def color_valid(color)
  color == 'blue' || color =='green'
end

# We don't need the if conditions at all for this method, since we are only checking 2 values
# we can use the  or "||" boolean operator to verify if we have either one of the options to return
# if is a valid color. 
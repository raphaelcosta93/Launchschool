# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

p advice

#outputs

# "Few things in life are as urgent as house training your pet dinosaur."

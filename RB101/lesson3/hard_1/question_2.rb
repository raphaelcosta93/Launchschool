#What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#the code below is going to print a => hi there, because informal_greeting and greetings
#both are poiting to the same object id, and when we use the shovel method which mutates the
#caller greetings also gets mutated and points to the same object
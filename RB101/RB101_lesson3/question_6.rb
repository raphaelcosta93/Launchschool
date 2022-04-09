# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

p "four score and" + famous_words 

p  "four score and" << famous_words

p famous_words.prepend("four score and")
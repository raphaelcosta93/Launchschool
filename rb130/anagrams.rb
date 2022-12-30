=begin
create a class Anagram, that has a constructor method that takes a string a word.downcase
create a instance method match that if a Anagram is found return it
  initialize  a empty array local variable result
  iterate through each current_word
    check if the word the current_word is equal the word if so skip the word
    iterate trough each charater of the current_word.downcase
    check if all the counts of current_word are equal for the instance variable word, if so add to result


=end


class Anagram

  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    result = []
    
    array.each do |current_word|
      if current_word.chars.all? {|letter| current_word.downcase.count(letter.downcase) == word.count(letter.downcase)} && current_word.size == word.size && current_word.downcase != word

        result << current_word
      end      
    end
    result
  end
end


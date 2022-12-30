class Scrabble
  def initialize(scrabble_word)
    @scrabble_word = scrabble_word
  end

  POINTS = { 'A' => 1, 'E' => 1, 'I' => 1, "O" => 1, "U" => 1, "L" => 1,
             "N" => 1, "R" => 1, "S" => 1, "T" => 1, 'D' => 2, "G" => 2,
             "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4,
             "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8,
             "Q" => 10, "Z" => 10 }
  def score
    return 0 if scrabble_word.nil?
    result = 0

    scrabble_word.each_char do |char|
      result += POINTS[char.upcase] if POINTS.include?(char.upcase)
    end
    result
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  private

  attr_reader :scrabble_word
end

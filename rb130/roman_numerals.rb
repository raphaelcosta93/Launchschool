=begin
write a program that takes a integer and converts that integer to it's roman number 
version string

M- 1000
D - 500
C 100
L 50
X 10
V 5
I 1

Write a class that the constructor takes 1 integer and set as instance variable number
write a method that converts the number to it's roman version

when writing the method, check what's the closest key that we can find out of the hash
when we found add the key to the result and check if there's a remainder if so look for
  closest key for remainder on the hash
  stop when theres no remainder


=end

class RomanNumeral

  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000,
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end

  private
  attr_reader :number
end

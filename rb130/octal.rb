class Octal
  def initialize(string)
    @number = string
  end

  def to_decimal
    return 0 unless valid_octal?(number)
    total = []
    multiplier = 0

    index = number.size - 1
    index.downto(0) do |idx|
      total << number[idx].to_i * (8**multiplier)
      multiplier += 1
    end
    total.sum
  end

  private

  attr_reader :number

  def valid_octal?(num)
    num.chars.all? { |n| n =~ /[0-7]/ }
  end
end

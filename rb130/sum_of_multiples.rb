class SumOfMultiples
  def initialize(number1, number2, number3=0)
    @number1 = number1
    @number2 = number2
    @number3 = number3
  end

  def to(target_number)
    return 0 if target_number == 1
    total = []

    2.upto(target_number - 1) do |current_num|
      total << current_num if current_num % number1 == 0
      total << current_num if current_num % number2 == 0
      next if number3 == 0
      total << current_num if current_num % number3 == 0
    end
    total.uniq.sum
  end

  def self.to(target_number)
    SumOfMultiples.new(3, 5).to(target_number)
  end

  private

  attr_reader :number1, :number2, :number3
end

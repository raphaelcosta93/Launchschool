class PerfectNumber
  def self.classify(number)
    raise StandardError if number <= 0
    total = 0

    1.upto(number - 1) { |num| total += num if number % num == 0 }

    return 'perfect' if total == number
    return 'deficient' if total < number
    'abundant'
  end
end

class CustomSet
  def initialize(custom = [])
    @array = custom
  end

  def empty?
    array.empty?
  end

  def contains?(number)
    array.include?(number)
  end

  def subset?(other_set)
    array.all? { |num| array.count(num) <= other_set.array.count(num) }
  end

  def disjoint?(other_set)
    array.all? { |num| array.count(num) != other_set.array.count(num) }
  end

  def eql?(other_set)
    return false if empty? && other_set.array.size >= 1
    return false if array.size >= 1 && other_set.empty?
    array.all? { |num| other_set.array.include?(num) }
  end

  def add(number)
    array << number.to_i
    self
  end

  def ==(other_set)
    eql?(other_set)
  end

  def intersection(other_set)
    new_array = []
    array.each do |num|
      new_array << num if other_set.array.include?(num)
    end
    CustomSet.new(new_array)
  end

  def difference(other_set)
    new_array = []
    array.each do |num|
      new_array << num if !other_set.array.include?(num)
    end
    CustomSet.new(new_array)
  end

  def union(other_set)
    new_array = []
    array.each { |num| new_array << num unless new_array.include?(num) }
    other_set.array.each { |num| new_array << num unless new_array.include?(num) } # rubocop:disable Layout/LineLength
    CustomSet.new(new_array.sort)
  end

  protected

  attr_reader :array
end

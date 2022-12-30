class Series
  def initialize(serie)
    @serie = serie
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @serie.size
    result = []

    serie.chars.each_index do |index|
      current_slice = serie[index, slice_size]
      temp_result = []
      current_slice.each_char { |char| temp_result << char.to_i }
      result << temp_result
    end
    result.select { |array| array.size == slice_size }
  end

  private

  attr_reader :serie
end

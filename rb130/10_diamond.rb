class Diamond
  def self.make_diamond(diamond)
    array = ('A'..diamond).to_a
    result = ''
    initial_spacing = array.size - 1
    middle_spacing = 1

    array.each do |row|
      if row == 'A'
        result << "#{' ' * initial_spacing}#{row}#{' ' * initial_spacing}\n"
        initial_spacing += -1
      else
        result << "#{' ' * initial_spacing}#{row}#{' ' * middle_spacing}#{row}#{' ' * initial_spacing}\n"
        initial_spacing += -1 unless row == diamond
        middle_spacing += 2 unless row == diamond
      end
    end

    array.reverse[1..-1].each do |row|
      initial_spacing += 1
      middle_spacing += -2
      if row == 'A'
        result << "#{' ' * initial_spacing}#{row}#{' ' * initial_spacing}\n"
      else
        result << "#{' ' * initial_spacing}#{row}#{' ' * middle_spacing}#{row}#{' ' * initial_spacing}\n"
      end
    end
    result
  end
end

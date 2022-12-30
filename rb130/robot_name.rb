class Robot
  @@used_names = []

  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    @@used_names.delete(name)
    generate_name
  end

  private

  attr_writer :name

  def generate_name
    loop do
      new_name = []
      new_name << ('A'..'Z').to_a.sample(2)
      new_name << (0..9).to_a.sample(3)
      next if @@used_names.include?(new_name.join)
      @@used_names << new_name.join
      break
    end
    self.name = @@used_names[-1]
  end
end

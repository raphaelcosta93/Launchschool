=begin
problem-> write a class that contain DNA'S
write a instace method to count the hamming distance between two dnas.

explicity rules -> when comparing hamming distance if the size of the two dnas differ, only compare
using the shorter lenght, ignore the extra DNA pieces from the longer dna.



=end

class DNA

  def initialize(strand)
    @strand = strand
  end


  def hamming_distance(other)
    counter = 0
    idx = 0

    loop do
      counter += 1 if strand[idx] != other[idx]
      idx += 1
      break if idx >= strand.size || idx >= other.size
    end
    counter

  end

  protected
  attr_reader :strand
end


a = DNA.new('')
b = DNA.new('CATCGTAATGACGGCCTAAAAAA')

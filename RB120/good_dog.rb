# module Walkable
#   def walk
#     "I'm walking"
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing"
#   end
# end

# class Animal
#   include Walkable
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "I'm an animal and i speak "
#   end
# end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end



# class GoodDog < Animal
#   include Swimmable
#   include Climbable

#   DOG_YEARS = 7

#   attr_accessor :name, :height, :weight, :age
  
#   def initialize(n, h, w, a)
#     self.name = n
#     self.height = h
#     self.weight = w
#     self.age = a * DOG_YEARS
#   end

#   def speak
#     "#{name} says Arf!"
#   end
  
#   def change_info(n, h, w, a)
#     self.name = n
#     self.height = h
#     self.weight = w
#     self.age = a
#   end

#   def info
#     "#{self.name}, weighs #{self.weight} and is #{self.height} tall and #{self.age} years old in 
#     dog years."
#   end

#   def self.what_am_i
#     "I'm a GoodDog class"
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years. "
#   end

#   def what_is_self
#     self
#   end

#   def speak
#     super + " from GoodDog class"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end

# end



# sparky = GoodDog.new("Sparky", "12 Inches", "10lbs", 4)
# sparky.human_years
# p sparky.speak        # => "Hello! from GoodDog class"

# ruby = BadDog.new(2, "bear")
# puts GoodDog.ancestors

# puts sparky.info

# sparky.change_info("Spartacus", "24 Inches", "45lbs")
# puts sparky.info

# fido = GoodDog.new("Fido")
# puts fido.speak

# p sparky.what_is_self


# super -> will use the same argument from the subclass
# super(r, a) -> will use the argument passed to instatiate 
# super() -> will raise an error for argument not passed.


class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling)  # => true
sterling.older?(malory)  # => false

malory.age
  # => NoMethodError: protected method `age' called for #<Person: @age=64>
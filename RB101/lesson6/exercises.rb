

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodBoy
  include Speak
end

brew = GoodBoy.new
brew.speak('woof woof')



# module Speak
#   def speak(sound)
#     puts sound
#   end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end

# sparky = GoodDog.new
# sparky.speak("Arf!")        # => Arf!
# bob = HumanBeing.new
# bob.speak("Hello!")         # => Hello!
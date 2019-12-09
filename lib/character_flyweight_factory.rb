require_relative('./character_flyweight')

class CharacterFlyweightFactory
  attr_accessor :unicodes

  def initialize
    @unicodes = {}
  end

  def find_character_of(unicode)
    if unicodes.key?(unicode)
      character = unicodes[unicode]
    else
      flyweight = CharacterFlyweight.new(unicode)
      character = flyweight.find_character
      unicodes[flyweight.unicode_point] = character
    end

    character
  end
end

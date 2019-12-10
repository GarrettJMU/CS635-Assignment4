require_relative './character_flyweight'

class CharacterFlyweightFactory
  attr_accessor :unicodes

  def initialize
    @unicodes = {}
  end

  def get_character_for(unicode)
    if unicodes.key?(unicode)
      character = unicodes[unicode]
    else
      character = CharacterFlyweight.new(unicode)
      unicodes[unicode] = character
    end

    character
  end
end

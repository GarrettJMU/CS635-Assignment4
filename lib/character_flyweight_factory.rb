require_relative('./character_flyweight')

class CharacterFlyweightFactory
  attr_accessor :unicodes

  def initialize
    @unicodes = {}
  end

  def find_character_of(unicode)
    if unicodes.key?(unicode)
      unicode = unicodes[unicode]
    else
      unicode = CharacterFlyweight.new(unicode)
      unicodes[unicode.unicode_point] = unicode.find_character
    end

    unicode
  end
end

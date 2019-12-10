require_relative './strategy'
require_relative './character_and_font_flyweight_factory'

class FlyweightStrategy < Strategy
  attr_reader :character_and_font_flyweight_factory

  def initialize
    @character_and_font_flyweight_factory = CharacterAndFontFlyweightFactory.instance
  end

  def get_object_for(font, unicode_value)
    character_and_font_flyweight_factory.get_object_for(font, unicode_value)
  end
end

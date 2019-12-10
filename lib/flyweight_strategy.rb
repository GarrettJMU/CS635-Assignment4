require_relative './strategy'
require_relative './font_flyweight_factory'
require_relative './character_flyweight_factory'

class FlyweightStrategy < Strategy
  attr_reader :character_and_font_flyweight_factory

  def initialize
    @character_and_font_flyweight_factory = CharacterAndFontFlyweightFactory.new
  end

  def get_object_for(font, unicode_value)
    character_and_font_flyweight_factory.get_object_for(font, unicode_value)
  end
end

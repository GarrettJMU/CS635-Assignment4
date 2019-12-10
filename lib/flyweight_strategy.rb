require_relative './strategy'
require_relative './font_flyweight_factory'
require_relative './character_flyweight_factory'

class FlyweightStrategy < Strategy
  attr_reader :font_factory, :character_factory

  def initialize
    @font_factory = FontFlyweightFactory.new
    @character_factory = CharacterFlyweightFactory.new
  end

  def get_object_for(font, unicode_value)
    {
      font: font_factory.get_font_for(font),
      unicode: character_factory.get_character_for(unicode_value)
    }
  end
end

require_relative './strategy'
require_relative './font_flyweight'
require_relative './character_flyweight'

class NonFlyweightStrategy < Strategy
  def get_object_for(font, unicode_value)
    font_name = font[:font_name]
    font_size = font[:font_size]
    font_style = font[:font_style]
    {
      font: FontFlyweight.new(font_name, font_size, font_style),
      character: CharacterFlyweight.new(unicode_value)
    }
  end
end

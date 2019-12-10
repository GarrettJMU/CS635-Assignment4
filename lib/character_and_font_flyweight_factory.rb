require_relative './character_flyweight_factory'
require_relative './font_flyweight_factory'

class CharacterAndFontFlyweightFactory
  attr_accessor :font_and_characters
  attr_reader :character_factory, :font_factory

  def initialize
    @font_and_characters = {}
    @character_factory = CharacterFlyweightFactory.new
    @font_factory = FontFlyweightFactory.new
  end

  def get_object_for(unicode, font)
    if font_and_characters.key?({ character: unicode, font: font })
      character_and_font_pair = font_and_characters[unicode]
    else

      character_and_font_pair = {
        character: character_factory.get_character_for(unicode),
        font: font_factory.get_font_for(font[:font_name], font[:font_size], font[:font_style])
      }

      font_and_characters[unicode] = character_and_font_pair
    end

    character_and_font_pair
  end
end

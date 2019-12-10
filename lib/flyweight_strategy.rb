require_relative './strategy'
require_relative './font_flyweight_factory'
require_relative './character_flyweight_factory'

class FlyweightStrategy < Strategy
  attr_reader :font_factory, :character_factory

  def initialize
    @font_factory = FontFlyweightFactory.new
    @character_factory = CharacterFlyweightFactory.new
  end

  def calculate_stats(run_array, unicode_values)
    object_to_return = []

    unicode_values.each_with_index do |unicode_value, index|
      font = run_array.get_font_for_index(index)
      unicode = character_factory.find_character_of(unicode_value)
      object_to_return.push({ font: font_factory.get_font_for(font), unicode: unicode })
    end

    object_to_return
  end
end

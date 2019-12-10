require_relative('./character_flyweight_factory')
require_relative('./font_flyweight_factory')

class WordProcessor
  attr_reader :font_factory, :character_factory

  def initialize
    @font_factory = FontFlyweightFactory.new
    @character_factory = CharacterFlyweightFactory.new
  end

  def calculate_size_for(strategy)
    strategy.calculate_stats
  end
end

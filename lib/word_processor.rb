class WordProcessor
  attr_reader :font_factory

  def initialize(font_factory = FontFlyweightFactory.new)
    @font_factory = font_factory
  end
end

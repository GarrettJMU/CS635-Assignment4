class FontFlyweightFactory
  attr_reader :fonts

  def initialize
    @fonts = {}
  end
end

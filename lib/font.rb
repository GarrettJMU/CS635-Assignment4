class Font
  attr_reader :font_name, :font_size, :font_style

  def initialize(font_name, font_size, font_style = nil)
    @font_name = font_name
    @font_size = font_size
    @font_style = font_style
  end
end

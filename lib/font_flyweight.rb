class FontFlyweight
  attr_reader :font_name, :font_size, :font_style

  def initialize(font_name, font_size, font_style)
    @font_name = font_name
    @font_size = font_size
    @font_style = font_style
  end

  def get_font
    font = Font.new
    font.name = font_name
    font.size = font_size

    # I didn't include all of the different types of font styles here.
    # Ruby has bold, italic, outline and shadow built into their font class
    font.bold = true if font_style === 'bold'
    font.italic = true if font_style === 'italic'
    font.outline = true if font_style === 'outline'
    font.shadow = true if font_style === 'shadow'

    font
  end
end

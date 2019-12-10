class FontFlyweightFactory
  attr_reader :fonts

  def initialize
    @fonts = {}
  end

  def get_font_for(font_name, font_size, font_weight)
    font_args = {font_name: font_name, font_size: font_size, font_weight: font_weight}

    if fonts.key?(font_args)
      font = fonts[font_args]
    else
      font = FontFlyweight.new(font_name, font_size, font_weight)
      fonts[font_args] = font
    end

    font
  end
end

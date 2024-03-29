require_relative './font'
require 'singleton'

class FontFlyweightFactory
  include Singleton

  attr_reader :fonts

  def initialize
    @fonts = {}
  end

  def get_font_for(font_name, font_size, font_style = nil)
    font_args = { font_name: font_name, font_size: font_size, font_style: font_style }

    if fonts.key?(font_args)
      font = fonts[font_args]
    else
      font = Font.new(font_name, font_size, font_style)
      fonts[font_args] = font
    end

    font
  end
end

require_relative './strategy'
require_relative './font'
require_relative './character'

class NonFlyweightStrategy < Strategy
  def get_object_for(font, unicode_value)
    {
      font: Font.new(font[:font_name], font[:font_size], font[:font_style]),
      character: Character.new(unicode_value)
    }
  end
end

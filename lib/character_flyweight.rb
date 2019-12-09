class CharacterFlyweight
  attr_reader :unicode_point

  def initialize(unicode_point)
    @unicode_point = unicode_point
  end

  def find_character
    unicode_point.chr
  end
end

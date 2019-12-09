class CharacterFlyweight
  attr_reader :unicode

  def initialize(unicode)
    @unicode = unicode
  end

  def find_character
    unicode.encode('utf-8')
  end
end

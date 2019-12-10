require_relative './character'
require 'singleton'

class CharacterFlyweightFactory
  include Singleton

  attr_accessor :unicodes

  def initialize
    @unicodes = {}
  end

  def get_character_for(unicode)
    if unicodes.key?(unicode)
      character = unicodes[unicode]
    else
      character = Character.new(unicode)
      unicodes[unicode] = character
    end

    character
  end
end

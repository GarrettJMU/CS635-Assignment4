require 'spec_helper'
require_relative '../lib/flyweight_strategy'
require_relative '../lib/character_flyweight_factory'
require_relative '../lib/character'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font'
require_relative '../lib/character_and_font_flyweight_factory'

RSpec.describe FlyweightStrategy do
  describe '#initalize' do
    it 'should raise an error' do
      subject = described_class.new
      expect(subject.character_and_font_flyweight_factory).to be_an_instance_of(CharacterAndFontFlyweightFactory)
    end
  end

  describe '#get_object_for' do
    it 'should call the correct classes with correct args' do
      subject = described_class.new
      expect(subject.character_and_font_flyweight_factory).to receive(:get_object_for).with({ font_name: 'font', font_size: 10, font_style: nil }, 116)

      subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
    end

    it 'should return the proper classes' do
      subject = described_class.new
      get_object = subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
      expect(get_object[:font]).to be_an_instance_of(Font)
      expect(get_object[:character]).to be_an_instance_of(Character)
    end
  end
end

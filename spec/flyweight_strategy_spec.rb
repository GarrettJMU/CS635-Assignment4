require 'spec_helper'
require_relative '../lib/flyweight_strategy'
require_relative '../lib/character_flyweight_factory'
require_relative '../lib/character'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font'

RSpec.describe FlyweightStrategy do
  describe '#initalize' do
    it 'should raise an error' do
      subject = described_class.new
      expect(subject.character_factory).to be_an_instance_of(CharacterFlyweightFactory)
      expect(subject.font_factory).to be_an_instance_of(FontFlyweightFactory)
    end
  end

  describe '#get_object_for' do
    it 'should call the correct classes with correct args' do
      subject = described_class.new
      expect(subject.character_factory).to receive(:get_character_for).with(116)
      expect(subject.font_factory).to receive(:get_font_for).with('font', 10, nil)

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

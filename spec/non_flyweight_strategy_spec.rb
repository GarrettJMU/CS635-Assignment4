require 'spec_helper'
require_relative '../lib/non_flyweight_strategy'
require_relative '../lib/character_flyweight'
require_relative '../lib/font_flyweight'

RSpec.describe NonFlyweightStrategy do

  describe '#get_object_for' do
    it 'should call the correct classes with correct args' do
      subject = described_class.new
      expect(CharacterFlyweight).to receive(:new).with(116)
      expect(FontFlyweight).to receive(:new).with('font', 10, nil)

      subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
    end

    it 'should return the proper classes' do
      subject = described_class.new
      get_object = subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
      expect(get_object[:font]).to be_an_instance_of(FontFlyweight)
      expect(get_object[:character]).to be_an_instance_of(CharacterFlyweight)
    end
  end
end

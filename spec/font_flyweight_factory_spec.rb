require 'spec_helper'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font_flyweight'

RSpec.describe FontFlyweightFactory do

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.new
      expect(subject.fonts).to eq({})
    end
  end

  describe '#get_font_for' do
    context 'when the font has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.new
        subject.get_font_for('foo', 10)
        expect(subject.fonts.keys).to eq([{font_name: 'foo',font_size: 10, font_style: nil}])
      end

      # it 'should add more to the key value pair' do
      #   subject = described_class.new
      #   subject.find_character_of(116)
      #   subject.find_character_of(114)
      #   subject.find_character_of(115)
      #
      #   expect(subject.unicodes.keys).to eq([116, 114, 115])
      #   expect(subject.unicodes[116]).to be_an_instance_of(CharacterFlyweight)
      #   expect(subject.unicodes[114]).to be_an_instance_of(CharacterFlyweight)
      #   expect(subject.unicodes[115]).to be_an_instance_of(CharacterFlyweight)
      # end
    end

    # context 'when the unicode has already been called' do
    #   let(:character_114) { double('character', :unicode_point => 114) }
    #   let(:character_115) { double('character', :unicode_point => 115) }
    #   let(:character_116) { double('character', :unicode_point => 116) }
    #   it 'should not instantiate the class if its been called already' do
    #     subject = described_class.new
    #     expect(CharacterFlyweight).to receive(:new).with(116).and_return(character_116)
    #     expect(CharacterFlyweight).to receive(:new).with(114).and_return(character_114)
    #     expect(CharacterFlyweight).to receive(:new).with(115).and_return(character_115)
    #
    #
    #     subject.find_character_of(116)
    #     subject.find_character_of(114)
    #     subject.find_character_of(115)
    #     subject.find_character_of(115)
    #     subject.find_character_of(115)
    #     subject.find_character_of(116)
    #   end
    # end
  end
end

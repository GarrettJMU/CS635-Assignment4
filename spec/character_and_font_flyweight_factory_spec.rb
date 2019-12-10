require 'spec_helper'
require_relative '../lib/character_and_font_flyweight_factory'
require_relative '../lib/character_flyweight_factory'
require_relative '../lib/font_flyweight_factory'

RSpec.describe CharacterAndFontFlyweightFactory do

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.new
      expect(subject.font_and_characters).to eq({})
      expect(subject.font_factory).to be_instance_of(FontFlyweightFactory)
      expect(subject.character_factory).to be_instance_of(CharacterFlyweightFactory)
    end
  end

  describe '#get_object_for' do
    context 'when the pair has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.new
        subject.get_object_for(116, { font_name: 'foo', font_size: 10, font_style: 'bold' })
        expect(subject.font_and_characters.keys).to eq([{ character: 116, font: { font_name: 'foo', font_size: 10, font_style: 'bold' } }])
      end

      # it 'should add more to the key value pair' do
      #   subject = described_class.new
      #   subject.get_character_for(116)
      #   subject.get_character_for(114)
      #   subject.get_character_for(115)
      #
      #   expect(subject.unicodes.keys).to eq([116, 114, 115])
      #   expect(subject.unicodes[116]).to be_an_instance_of(Character)
      #   expect(subject.unicodes[114]).to be_an_instance_of(Character)
      #   expect(subject.unicodes[115]).to be_an_instance_of(Character)
      # end
    end
    #
    #   context 'when the unicode has already been called' do
    #     let(:character_114) { double('character', :unicode_point => 114) }
    #     let(:character_115) { double('character', :unicode_point => 115) }
    #     let(:character_116) { double('character', :unicode_point => 116) }
    #     it 'should not instantiate the class if its been called already' do
    #       subject = described_class.new
    #       expect(Character).to receive(:new).once.with(116).and_return(character_116)
    #       expect(Character).to receive(:new).once.with(114).and_return(character_114)
    #       expect(Character).to receive(:new).once.with(115).and_return(character_115)
    #
    #
    #       subject.get_character_for(116)
    #       subject.get_character_for(114)
    #       subject.get_character_for(115)
    #       subject.get_character_for(115)
    #       subject.get_character_for(115)
    #       subject.get_character_for(116)
    #     end
    #   end
  end
end

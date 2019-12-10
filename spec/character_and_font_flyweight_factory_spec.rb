require 'spec_helper'
require_relative '../lib/character_and_font_flyweight_factory'
require_relative '../lib/character_flyweight_factory'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font'
require_relative '../lib/character'

RSpec.describe CharacterAndFontFlyweightFactory do
  let(:font_1) { { font_name: 'foo', font_size: 10, font_style: 'bold' } }
  let(:font_2) { { font_name: 'foo', font_size: 10, font_style: 'italic' } }
  let(:font_3) { { font_name: 'foo', font_size: 12, font_style: 'bold' } }

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
        subject.get_object_for(116, font_1)
        expect(subject.font_and_characters.keys).to eq([{ character: 116, font: font_1 }])
      end

      it 'should add more to the key value pair' do
        subject = described_class.new
        subject.get_object_for(116, font_1)
        subject.get_object_for(117, font_2)
        subject.get_object_for(118, font_3)

        expect(subject.font_and_characters.keys).to eq([
                                                         { character: 116, font: font_1 },
                                                         { character: 117, font: font_2 },
                                                         { character: 118, font: font_3 }
                                                       ])
        expect(subject.font_and_characters[{ character: 116, font: font_1 }][:font]).to be_an_instance_of(Font)
        expect(subject.font_and_characters[{ character: 116, font: font_1 }][:character]).to be_an_instance_of(Character)
        expect(subject.font_and_characters[{ character: 117, font: font_2 }][:font]).to be_an_instance_of(Font)
        expect(subject.font_and_characters[{ character: 117, font: font_2 }][:character]).to be_an_instance_of(Character)
        expect(subject.font_and_characters[{ character: 118, font: font_3 }][:font]).to be_an_instance_of(Font)
        expect(subject.font_and_characters[{ character: 118, font: font_3 }][:character]).to be_an_instance_of(Character)
      end
    end

    context 'when the unicode has already been called' do
      let(:character_114) { double('character', :unicode_point => 114) }
      let(:character_115) { double('character', :unicode_point => 115) }
      let(:character_116) { double('character', :unicode_point => 116) }

      it 'should not instantiate the class if its been called already' do
        subject = described_class.new
        expect(subject.character_factory).to receive(:get_character_for).once.with(116).and_return(character_116)
        expect(subject.character_factory).to receive(:get_character_for).once.with(114).and_return(character_116)
        expect(subject.character_factory).to receive(:get_character_for).once.with(115).and_return(character_116)

        subject.get_object_for(116, font_1)
        subject.get_object_for(114, font_1)
        subject.get_object_for(115, font_1)
        subject.get_object_for(115, font_1)
        subject.get_object_for(115, font_1)
        subject.get_object_for(116, font_1)
      end
    end

    context 'when the font is already taken' do
      let(:font_1_obj) { double('font', :unicode_point => 114) }
      let(:font_2_obj) { double('font', :unicode_point => 115) }
      let(:font_3_obj) { double('font', :unicode_point => 116) }

      it 'should not instantiate the class if its been called already' do
        subject = described_class.new
        expect(subject.font_factory).to receive(:get_font_for).once.with(font_1[:font_name], font_1[:font_size], font_1[:font_style]).and_return(font_1_obj)
        expect(subject.font_factory).to receive(:get_font_for).once.with(font_2[:font_name], font_2[:font_size], font_2[:font_style]).and_return(font_2_obj)
        expect(subject.font_factory).to receive(:get_font_for).once.with(font_3[:font_name], font_3[:font_size], font_3[:font_style]).and_return(font_3_obj)


        subject.get_object_for(114, font_1)
        subject.get_object_for(114, font_1)
        subject.get_object_for(114, font_2)
        subject.get_object_for(114, font_2)
        subject.get_object_for(114, font_3)
        subject.get_object_for(114, font_3)
      end
    end
  end
end

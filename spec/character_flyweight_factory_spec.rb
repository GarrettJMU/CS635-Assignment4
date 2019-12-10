require 'spec_helper'
require_relative '../lib/character_flyweight_factory'

RSpec.describe CharacterFlyweightFactory do

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.new
      expect(subject.unicodes).to eq({})
    end
  end

  describe '#find_character_of' do
    context 'when the unicode has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.new
        subject.find_character_of(116)
        expect(subject.unicodes.keys).to eq([116])
      end

      # it 'should add more to the key value pair' do
      #   subject = described_class.new
      #   subject.find_character_of(116)
      #   subject.find_character_of(114)
      #   subject.find_character_of(115)

        # expect(subject.unicodes).to eq({ 114 => 'r', 115 => 's', 116 => 't' })
      # end
    end

    context 'when the unicode has already been called' do
      let(:character_114) { double('character', :unicode_point => 114, :find_character => 'r') }
      let(:character_115) { double('character', :unicode_point => 115, :find_character => 's') }
      let(:character_116) { double('character', :unicode_point => 116, :find_character => 't') }
      it 'should not instantiate the class if its been called already' do
        subject = described_class.new
        expect(CharacterFlyweight).to receive(:new).with(116).and_return(character_116)
        expect(CharacterFlyweight).to receive(:new).with(114).and_return(character_114)
        expect(CharacterFlyweight).to receive(:new).with(115).and_return(character_115)


        subject.find_character_of(116)
        subject.find_character_of(114)
        subject.find_character_of(115)
        subject.find_character_of(115)
        subject.find_character_of(115)
        subject.find_character_of(116)
      end
    end
  end
end

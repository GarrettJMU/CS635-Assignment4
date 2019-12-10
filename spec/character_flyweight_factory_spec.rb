require 'spec_helper'
require_relative '../lib/character_flyweight_factory'
require_relative '../lib/character'

RSpec.describe CharacterFlyweightFactory do

  describe 'singleton' do
    it 'should always be the same instance' do
      class_1 = CharacterFlyweightFactory.instance
      class_2 = CharacterFlyweightFactory.instance

      expect(class_1.equal?(class_2)).to eq(true)
    end
  end

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.instance
      expect(subject.unicodes).to eq({})
    end
  end

  describe '#get_character_for' do
    context 'when the unicode has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.instance
        subject.get_character_for(116)
        expect(subject.unicodes.keys).to eq([116])
      end

      it 'should add more to the key value pair' do
        subject = described_class.instance
        subject.get_character_for(116)
        subject.get_character_for(114)
        subject.get_character_for(115)

        expect(subject.unicodes.keys).to eq([116, 114, 115])
        expect(subject.unicodes[116]).to be_an_instance_of(Character)
        expect(subject.unicodes[114]).to be_an_instance_of(Character)
        expect(subject.unicodes[115]).to be_an_instance_of(Character)
      end
    end

    context 'when the unicode has already been called' do
      let(:character_114) { double('character', :unicode_point => 134) }
      let(:character_115) { double('character', :unicode_point => 135) }
      let(:character_116) { double('character', :unicode_point => 136) }
      it 'should not instantiate the class if its been called already' do
        subject = described_class.instance
        expect(Character).to receive(:new).once.with(136).and_return(character_116)
        expect(Character).to receive(:new).once.with(134).and_return(character_114)
        expect(Character).to receive(:new).once.with(135).and_return(character_115)


        subject.get_character_for(136)
        subject.get_character_for(134)
        subject.get_character_for(135)
        subject.get_character_for(135)
        subject.get_character_for(135)
        subject.get_character_for(136)
      end
    end
  end
end

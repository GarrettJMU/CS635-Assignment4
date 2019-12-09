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
        expect(subject.unicodes).to eq({ 116 => "t" })
      end
    end

    context 'when the unicode has already been called' do

    end

    it 'should not create a new instance' do
      subject = described_class.new

      expect(subject.unicodes).to eq({})
    end
  end
end

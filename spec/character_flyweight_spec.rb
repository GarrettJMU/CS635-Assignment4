require 'spec_helper'
require_relative '../lib/character_flyweight'

RSpec.describe CharacterFlyweight do
  describe '#initialize' do
    it 'should accept the unicode as a class variable' do
      subject = described_class.new('foo')
      expect(subject.unicode_point).to eq('foo')
    end
  end

  describe '#find_character' do
    it 'should return the value' do
      subject = described_class.new(116)
      expect(subject.find_character).to eq('t')
    end
  end
end

require 'spec_helper'
require_relative '../lib/character_flyweight'

RSpec.describe CharacterFlyweight do
  describe '#initialize' do
    it 'should accept the unicode as a class variable' do
      subject = described_class.new('foo')
      expect(subject.unicode_point).to eq('foo')
    end
  end
end

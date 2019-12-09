require 'spec_helper'
require_relative '../lib/character_flyweight_factory'

RSpec.describe CharacterFlyweightFactory do

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.new
      expect(subject.unicodes).to eq({})
    end
  end
end

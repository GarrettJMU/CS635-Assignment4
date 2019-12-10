require 'spec_helper'
require_relative '../lib/word_processor'
require_relative '../lib/flyweight_strategy'
require_relative '../lib/run_array'

RSpec.describe WordProcessor do
  describe '#initialize' do
    it 'should initialize with correct' do
      subject = described_class.new
      expect(subject.strategy).to be_an_instance_of(FlyweightStrategy)
      expect(subject.run_array).to be_an_instance_of(RunArray)
      expect(subject.unicode_values.length).to eq(200)
    end
  end
end

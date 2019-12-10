require 'spec_helper'
require_relative '../lib/strategy'

RSpec.describe Strategy do
  describe '#calculate_stats' do
    it 'should raise an error' do
      expect {Strategy.new.calculate_stats("")}.to raise_error(NotImplementedError)
    end
  end
end

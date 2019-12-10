require 'spec_helper'
require_relative '../lib/flyweight_strategy'

RSpec.describe FlyweightStrategy do
  describe '#calculate_stats' do
    it 'should raise an error' do
      expect {Strategy.new.get_object_for("")}.to raise_error(NotImplementedError)
    end
  end
end
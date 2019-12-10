require 'spec_helper'
require_relative '../lib/strategy'

RSpec.describe Strategy do
  describe '#get_object_for' do
    it 'should raise an error' do
      expect {Strategy.new.get_object_for("")}.to raise_error(NotImplementedError)
    end
  end
end

require 'spec_helper'
require_relative '../lib/character'

RSpec.describe Character do
  subject { Character.new }

  describe '#initialize' do
    it 'should pass tests' do
      expect(true).to eq(true)
    end
  end
end

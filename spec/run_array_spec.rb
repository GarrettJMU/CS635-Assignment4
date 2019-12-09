require 'spec_helper'
require_relative '../lib/run_array'

RSpec.describe RunArray do

  subject { described_class.new }

  describe '#initialize' do
    it 'should create an empty array' do
      expect(subject.font_array).to eq([])
    end
  end

  describe '#add_run' do
    it 'should pass' do
      expect(true).to eq(true)
    end
  end

  describe '#append_run' do
    it 'should pass' do
      expect(true).to eq(true)
    end
  end

  describe '#build_object' do
    it 'should pass' do
      expect(true).to eq(true)
    end
  end

  describe '#get_last_index' do
    it 'should pass' do
      expect(true).to eq(true)
    end
  end

end

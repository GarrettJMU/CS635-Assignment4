require 'spec_helper'
require_relative '../lib/run_array'

RSpec.describe RunArray do

  subject { described_class.new }
  let(:font) { double('font') }

  describe '#initialize' do
    it 'should create an empty array' do
      expect(subject.font_array).to eq([])
    end
  end

  describe '#add_run' do
    it 'should add first correctly' do
      subject.add_run(0, 255, font)

      expect(subject.font_array).to eq([{ starting_index: 0, ending_index: 255, font: font }])
    end

    it 'should add more correctly' do
      subject.add_run(0, 255, font)
      subject.add_run(256, 500, font)

      expect(subject.font_array.length).to eq(2)
      expect(subject.font_array).to eq([
                                         { starting_index: 0, ending_index: 255, font: font },
                                         { starting_index: 256, ending_index: 500, font: font }
                                       ])
    end
  end

  describe '#append_run' do
    it 'should add first correctly' do
      subject.append_run(255, font)

      expect(subject.font_array).to eq([{ starting_index: 0, ending_index: 255, font: font }])
    end

    it 'should append more correctly' do
      subject.add_run(0, 255, font)
      subject.append_run(500, font)

      expect(subject.font_array.length).to eq(2)
      expect(subject.font_array).to eq([
                                         { starting_index: 0, ending_index: 255, font: font },
                                         { starting_index: 256, ending_index: 500, font: font }
                                       ])
    end
  end

  describe '#build_object' do
    it 'should return the correct object' do
      expect(subject.send(:build_object, 1, 2, font)).to eq({starting_index: 1, ending_index: 2, font: font})
    end
  end

  describe '#get_last_index' do
    it 'should return last index if none are there' do
      expect(subject.send(:get_last_index)).to eq(0)
    end

    it 'should return the last index if there are some present' do
      subject.add_run(0, 255, font)
      expect(subject.send(:get_last_index)).to eq(256)
    end
  end
end

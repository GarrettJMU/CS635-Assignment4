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
      expect(subject.unicode_values.length).to eq(0)
    end
  end

  describe '#calculate_size' do
    let(:memory_profiler) { double('memory_profiler') }
    it 'should call gem to execute' do
      subject = described_class.new
      subject.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
      subject.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
      subject.run_array.append_run(200, { font_name: 'Times New Roman', font_size: 16 })

      subject.unicode_values = 200.times.map do
        rand(97..122)
      end
      expect(MemoryProfiler).to receive(:report).and_return(memory_profiler)
      expect(memory_profiler).to receive(:pretty_print)

      subject.calculate_size
    end

    it 'should return the object that was analyzed' do
      subject = described_class.new
      subject.run_array.append_run(100, { font_name: 'Times New Roman', font_size: 12, font_style: 'bold' })
      subject.run_array.append_run(150, { font_name: 'Ariel', font_size: 16, font_style: 'bold' })
      subject.run_array.append_run(200, { font_name: 'Times New Roman', font_size: 16 })

      subject.unicode_values = 200.times.map do
        rand(97..122)
      end

      expect(subject.calculate_size.length).to eq(200)
    end
  end

  describe '@unicode_values' do
    it 'should set the values to only be between 97 and 122' do
      subject = described_class.new
      subject.unicode_values = 1000.times.map do
        rand(97..122)
      end
      subject.unicode_values.each do |unicode_value|
        expect(unicode_value).to be_between(97, 122)
      end
    end

    it 'should keep creating new array sets if we want' do
      subject = described_class.new
      subject.unicode_values = 1.times.map do
        rand(97..122)
      end

      expect(subject.unicode_values.length).to eq(1)

      subject.unicode_values = 1000.times.map do
        rand(97..122)
      end

      expect(subject.unicode_values.length).to eq(1000)
    end
  end
end

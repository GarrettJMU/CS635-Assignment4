require 'spec_helper'
require_relative '../lib/font_flyweight'

RSpec.describe FontFlyweight do
  describe '#initialize' do
    it 'should set all instance variables correctly' do
      subject = described_class.new('times new roman', 12, 'bold')
      expect(subject.font_name).to eq('times new roman')
      expect(subject.font_size).to eq(12)
      expect(subject.font_style).to eq('bold')
    end

    it 'should default font style to nil' do
      subject = described_class.new('times new roman', 12)

      expect(subject.font_name).to eq('times new roman')
      expect(subject.font_size).to eq(12)
      expect(subject.font_style).to eq(nil)
    end
  end
end

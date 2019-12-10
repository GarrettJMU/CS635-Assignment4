require 'spec_helper'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font'

RSpec.describe FontFlyweightFactory do

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.new
      expect(subject.fonts).to eq({})
    end
  end

  describe '#get_font_for' do
    context 'when the font has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.new
        subject.get_font_for('foo', 10, 'bold')
        expect(subject.fonts.keys).to eq([{ font_name: 'foo', font_size: 10, font_style: 'bold' }])
      end

      it 'should create a new key in the class unicodes and default font style if none provided' do
        subject = described_class.new
        subject.get_font_for('foo', 10)
        expect(subject.fonts.keys).to eq([{ font_name: 'foo', font_size: 10, font_style: nil }])
      end

      it 'should add more to the key value pair' do
        subject = described_class.new
        subject.get_font_for('foo', 10, 'bold')
        subject.get_font_for('bar', 12)
        subject.get_font_for('foo', 16, 'italic')

        expect(subject.fonts.keys).to eq([
                                           { font_name: 'foo', font_size: 10, font_style: 'bold' },
                                           { font_name: 'bar', font_size: 12, font_style: nil },
                                           { font_name: 'foo', font_size: 16, font_style: 'italic' }
                                         ])
        expect(subject.fonts[{ font_name: 'foo', font_size: 10, font_style: 'bold' }]).to be_an_instance_of(Font)
        expect(subject.fonts[{ font_name: 'bar', font_size: 12, font_style: nil }]).to be_an_instance_of(Font)
        expect(subject.fonts[{ font_name: 'foo', font_size: 16, font_style: 'italic' }]).to be_an_instance_of(Font)
      end
    end

    context 'when the unicode has already been called' do
      let(:font_1) { double('font', :unicode_point => 114) }
      let(:font_2) { double('font', :unicode_point => 115) }
      let(:font_3) { double('font', :unicode_point => 116) }

      it 'should not instantiate the class if its been called already' do
        subject = described_class.new
        expect(Font).to receive(:new).once.with('foo', 10, 'bold').and_return(font_1)
        expect(Font).to receive(:new).once.with('bar', 12, nil).and_return(font_2)
        expect(Font).to receive(:new).once.with('foo', 16, 'italic').and_return(font_3)

        subject.get_font_for('foo', 10, 'bold')
        subject.get_font_for('bar', 12,)
        subject.get_font_for('foo', 16, 'italic')
        subject.get_font_for('foo', 16, 'italic')
        subject.get_font_for('bar', 12,)
        subject.get_font_for('foo', 10, 'bold')
      end
    end
  end
end

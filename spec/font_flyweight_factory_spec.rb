require 'spec_helper'
require_relative '../lib/font_flyweight_factory'
require_relative '../lib/font'

RSpec.describe FontFlyweightFactory do

  describe 'singleton' do
    it 'should always be the same instance' do
      class_1 = FontFlyweightFactory.instance
      class_2 = FontFlyweightFactory.instance

      expect(class_1.equal?(class_2)).to eq(true)
    end
  end

  describe '#initialize' do
    it 'should create an empty object' do
      subject = described_class.instance
      expect(subject.fonts).to eq({})
    end
  end

  describe '#get_font_for' do
    context 'when the font has not already been called' do
      it 'should create a new key in the class unicodes' do
        subject = described_class.instance
        subject.get_font_for('foo', 10, 'bold')
        expect(subject.fonts.keys).to eq([{ font_name: 'foo', font_size: 10, font_style: 'bold' }])
      end

      it 'should create a new key in the class unicodes and default font style if none provided' do
        subject = described_class.instance
        subject.get_font_for('foo', 10)
        expect(subject.fonts.keys).to eq([{ font_name: 'foo', font_size: 10, font_style: 'bold' },
                                          { font_name: 'foo', font_size: 10, font_style: nil }])
      end

      it 'should add more to the key value pair' do
        subject = described_class.instance

        subject.get_font_for('foo', 10, 'bold')
        subject.get_font_for('bar', 12)
        subject.get_font_for('foo', 16, 'italic')

        expect(subject.fonts.keys).to eq([
                                           { font_name: 'foo', font_size: 10, font_style: 'bold' },
                                           { font_name: 'foo', font_size: 10, font_style: nil },
                                           { font_name: 'bar', font_size: 12, font_style: nil },
                                           { font_name: 'foo', font_size: 16, font_style: 'italic' }
                                         ])
        expect(subject.fonts[{ font_name: 'foo', font_size: 10, font_style: 'bold' }]).to be_an_instance_of(Font)
        expect(subject.fonts[{ font_name: 'bar', font_size: 12, font_style: nil }]).to be_an_instance_of(Font)
        expect(subject.fonts[{ font_name: 'foo', font_size: 16, font_style: 'italic' }]).to be_an_instance_of(Font)
      end
    end

    context 'when the unicode has already been called' do
      let(:font_1) { double('font')}
      let(:font_2) { double('font')}
      let(:font_3) { double('font')}

      it 'should not instantiate the class if its been called already' do
        subject = described_class.instance
        expect(Font).to receive(:new).once.with('foo', 20, 'bold').and_return(font_1)
        expect(Font).to receive(:new).once.with('bar', 22, nil).and_return(font_2)
        expect(Font).to receive(:new).once.with('foo', 26, 'italic').and_return(font_3)

        subject.get_font_for('foo', 20, 'bold')
        subject.get_font_for('bar', 22,)
        subject.get_font_for('foo', 26, 'italic')
        subject.get_font_for('foo', 26, 'italic')
        subject.get_font_for('bar', 22,)
        subject.get_font_for('foo', 20, 'bold')
      end
    end
  end
end

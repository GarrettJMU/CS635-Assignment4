require 'spec_helper'
require_relative '../lib/non_flyweight_strategy'
require_relative '../lib/character'
require_relative '../lib/font'

RSpec.describe NonFlyweightStrategy do

  describe '#get_object_for' do
    it 'should call the correct classes with correct args' do
      subject = described_class.new
      expect(Character).to receive(:new).with(116)
      expect(Font).to receive(:new).with('font', 10, nil)

      subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
    end

    it 'should return the proper classes' do
      subject = described_class.new
      get_object = subject.get_object_for({ font_name: 'font', font_size: 10, font_style: nil }, 116)
      expect(get_object[:font]).to be_an_instance_of(Font)
      expect(get_object[:character]).to be_an_instance_of(Character)
    end
  end
end

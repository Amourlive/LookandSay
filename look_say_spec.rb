require 'rspec'
require_relative 'look_say'

describe LookSay do
  subject(:sequence) { LookSay.new }

  let(:reference) do
    [1, 11, 21, 1211, 111_221, 312_211, 13_112_221, 1_113_213_211,
     31_131_211_131_221, 13_211_311_123_113_112_211]
  end

  describe '#next' do
    it 'return next item' do
      5.times do |key|
        expect(sequence.next).to eq(reference[key])
      end
    end
  end

  describe 'value_at' do
    it 'return' do
      expect(sequence.value_at(3)).to eq(reference[3])
    end
  end

  describe '#rewind' do
    it 'Rewinds the enumeration sequence to the beginning' do
      sequence.next
      sequence.rewind
      expect(sequence.next).to eq(1)
    end
  end

  describe '#take' do
    it 'return array with item of sequence' do
      expect(sequence.take(10)).to eq(reference)
    end
  end
end
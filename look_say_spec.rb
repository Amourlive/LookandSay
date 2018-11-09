require 'rspec'
require_relative 'look_say'

describe LookSay do
  subject(:sequence) { LookSay.new }

  let(:reference) do
    [1,
     11,
     21,
     1211,
     111_221,
     312_211,
     13_112_221,
     1_113_213_211,
     31_131_211_131_221,
     13_211_311_123_113_112_211]
  end

  describe '#next' do
    it 'return next value' do
      expect(sequence.next).to eq(1)
      expect(sequence.next).to eq(11)
      expect(sequence.next).to eq(21)
    end
  end

  describe '#take' do
    it 'return array with item of sequence' do
      expect(sequence.take(10)).to eq(reference)
    end
  end
end
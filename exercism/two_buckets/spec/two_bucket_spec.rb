require_relative '../two_bucket.rb'
require 'rspec'

RSpec.describe TwoBucket do
  describe 'easy case, match statr bucket' do
    let(:two_bucket) { TwoBucket.new(3, 5, 3, 'one') }

    it do
      expect(two_bucket.moves).to eq(1)
      expect(two_bucket.other_bucket).to eq(0)
    end
  end

  describe 'easy case, not match statr bucket' do
    let(:two_bucket) { TwoBucket.new(3, 5, 5, 'one') }

    it do
      expect(two_bucket.moves).to eq(2)
      expect(two_bucket.other_bucket).to eq(3)
    end
  end

  describe 'pour_from_start_bucket' do
    it do
      two_bucket = TwoBucket.new(3, 5, 1, 'one')
      expect(two_bucket.moves).to eq(4)
      expect(two_bucket.other_bucket).to eq(5)
    end
    
    it do
      two_bucket = TwoBucket.new(3, 5, 1, 'two')
      expect(two_bucket.moves).to eq(8)
      expect(two_bucket.other_bucket).to eq(3)
    end

    it do
      two_bucket = TwoBucket.new(3, 5, 3, 'two')
      expect(two_bucket.moves).to eq(2)
    end

    it do
      two_bucket = TwoBucket.new(3, 5, 5, 'two')
      expect(two_bucket.moves).to eq(1)
    end
  end
end

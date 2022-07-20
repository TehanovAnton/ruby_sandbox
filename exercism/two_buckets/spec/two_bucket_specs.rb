# frozen_string_literal: true

require_relative '../two_bucket'

RSpec.describe TwoBucket do
  context 'first set' do
    let(:two_bucket) { TwoBucket.new(3, 5, 1, 'one') }

    it do
      expect(two_bucket.moves).to eq(4)
      expect(two_bucket.goal_bucket).to eq('one')
      expect(two_bucket.other_bucket).to eq(5)
    end
  end

  context 'second set' do
    let(:two_bucket) { TwoBucket.new(3, 5, 1, 'two') }

    it do
      expect(two_bucket.moves).to eq(8)
      expect(two_bucket.goal_bucket).to eq('two')
      expect(two_bucket.other_bucket).to eq(3)
    end
  end

  context 'third set' do
    let(:two_bucket) { TwoBucket.new(7, 11, 2, 'one') }

    it do
      expect(two_bucket.moves).to eq(14)
      expect(two_bucket.goal_bucket).to eq('one')
      expect(two_bucket.other_bucket).to eq(11)
    end
  end

  context 'fourth set' do
    let(:two_bucket) { TwoBucket.new(7, 11, 2, 'two') }

    it do
      expect(two_bucket.moves).to eq(18)
      expect(two_bucket.goal_bucket).to eq('two')
      expect(two_bucket.other_bucket).to eq(7)
    end
  end

  context 'fifth set' do
    let(:two_bucket) { TwoBucket.new(1, 3, 3, 'two') }

    it do
      expect(two_bucket.moves).to eq(1)
      expect(two_bucket.goal_bucket).to eq('two')
      expect(two_bucket.other_bucket).to eq(0)
    end
  end

  context 'sixth set' do
    let(:two_bucket) { TwoBucket.new(2, 3, 3, 'one') }

    it do
      expect(two_bucket.moves).to eq(2)
      expect(two_bucket.goal_bucket).to eq('two')
      expect(two_bucket.other_bucket).to eq(2)
    end
  end
end

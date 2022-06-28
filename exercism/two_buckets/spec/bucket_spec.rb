require_relative '../bucket.rb'
require 'rspec'

RSpec.describe Bucket do
  let(:bucket) { Bucket.new(3) }

  it 'feel bucket' do
    bucket.feel
    expect(bucket.value).to eq(bucket.size)
  end

  it 'empty bucket' do
    bucket.empty
    expect(bucket.value).to eq(0)
  end

  it 'calculate free volume' do
    bucket.empty
    expect(bucket.free_value).to eq(bucket.size)
  end

  it 'full?' do
    bucket.empty
    expect(bucket.full?).to eq(false)
  end

  it 'empty?' do
    bucket.empty
    expect(bucket.empty?).to eq(true)
  end

  describe "#can_pour_from_bucket?" do
    let(:bucket_b) { Bucket.new(3) }
    let(:bucket_a) { Bucket.new(4) }

    it 'cannot pour' do
      expect(bucket_a.can_pour_from_bucket?(bucket_b)).to eq(false)

      bucket_a.feel
      expect(bucket_a.can_pour_from_bucket?(bucket_b)).to eq(false)
    end

    it 'can pour' do
      bucket_b.feel
      expect(bucket_a.can_pour_from_bucket?(bucket_b)).to eq(true)
    end
  end

  describe "#pour_from" do
    let(:bucket_b) { Bucket.new(3) }
    let(:bucket_a) { Bucket.new(4) }

    it 'pour from' do
      bucket_a.feel
      bucket_b.pour_from(bucket_a)
      expect(bucket_b.value).to eq(3)
      expect(bucket_a.value).to eq(1)

      bucket_a.pour_from(bucket_b)
      expect(bucket_a.value).to eq(4)
      expect(bucket_b.value).to eq(0)
    end
  end
end

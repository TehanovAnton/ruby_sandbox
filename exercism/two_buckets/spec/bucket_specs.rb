# frozen_string_literal: true

require_relative '../bucket'

RSpec.describe Bucket do
  let(:bucket) { Bucket.new(volume: 10) }

  describe '#pour' do
    it 'should fill the bucket' do
      bucket.pour
      expect(bucket.filled_volume).to eq(10)
    end
  end

  describe '#pour_to' do
    context 'when pour volume less then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10, value: 5) }
      let(:bucket_two) { Bucket.new(volume: 10) }

      it 'should pour to the second bucket' do
        bucket_one.pour_to(bucket_two)
        expect(bucket_two.filled_volume).to eq(5)
        expect(bucket_one.filled_volume).to eq(0)
      end
    end

    context 'when pour volume equale then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10, value: 5) }
      let(:bucket_two) { Bucket.new(volume: 10, value: 5) }

      it 'should pour to the second bucket' do
        bucket_one.pour_to(bucket_two)
        expect(bucket_two.filled_volume).to eq(10)
        expect(bucket_one.filled_volume).to eq(0)
      end
    end

    context 'when pour volume more then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10, value: 5) }
      let(:bucket_two) { Bucket.new(volume: 10, value: 6) }

      it 'should pour to the second bucket' do
        bucket_one.pour_to(bucket_two)
        expect(bucket_two.filled_volume).to eq(10)
        expect(bucket_one.filled_volume).to eq(1)
      end
    end
  end

  describe '#pour_from' do
    context 'when pour volume less then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10) }
      let(:bucket_two) { Bucket.new(volume: 10, value: 5) }

      it 'should pour from the first bucket' do
        bucket_one.pour_from(bucket_two)
        expect(bucket_two.filled_volume).to eq(0)
        expect(bucket_one.filled_volume).to eq(5)
      end
    end

    context 'when pour volume equale then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10, value: 5) }
      let(:bucket_two) { Bucket.new(volume: 10, value: 5) }

      it 'should pour from the first bucket' do
        bucket_one.pour_from(bucket_two)
        expect(bucket_two.filled_volume).to eq(0)
        expect(bucket_one.filled_volume).to eq(10)
      end
    end

    context 'when pour volume more then free volume' do
      let(:bucket_one) { Bucket.new(volume: 10, value: 6) }
      let(:bucket_two) { Bucket.new(volume: 10, value: 5) }

      it 'should pour from the first bucket' do
        bucket_one.pour_from(bucket_two)
        expect(bucket_two.filled_volume).to eq(1)
        expect(bucket_one.filled_volume).to eq(10)
      end
    end
  end
end

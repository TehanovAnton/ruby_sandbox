# frozen_string_literal: true

require_relative './i_bucket'
require_relative './bucket_exception'

# Bucket
class Bucket < IBucket
  def pour
    @value = volume
  end

  def pour_to(bucket)
    out_volume = possible_decrease_volume(out_volume: bucket.free_volume)
    in_volume = decrease_volume(out_volume: out_volume)

    bucket.increase_value(in_volume: bucket.possible_increase_volume(in_volume: in_volume))
  end

  def pour_from(bucket)
    out_volume = bucket.possible_decrease_volume(out_volume: free_volume)
    in_volume = bucket.decrease_volume(out_volume: out_volume)

    increase_value(in_volume: possible_increase_volume(in_volume: in_volume))
  end

  protected

  def decrease_volume(out_volume:)
    raise BucketException.new(message: 'Can not pour out') if out_volume.negative? || out_volume > filled_volume

    @value -= out_volume

    out_volume
  end

  def increase_value(in_volume:)
    raise BucketException.new(message: 'Can not pour in') if in_volume.negative? || in_volume > free_volume

    @value += in_volume

    in_volume
  end

  def possible_increase_volume(in_volume:)
    return in_volume if in_volume <= free_volume

    free_volume
  end

  def possible_decrease_volume(out_volume:)
    return out_volume if out_volume <= filled_volume

    filled_volume
  end
end

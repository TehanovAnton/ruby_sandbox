# frozen_string_literal: true

require './i_bucket'
require './bucket_exception'

# Bucket
class Bucket < IBucket
  def pour
    @value = volume
  end

  def pour_to(bucket)
    bucket.increase_value(decrease_volume)
  end

  def pour_from(bucket)
    increase_value(bucket.decrease_volume)
  end

  protected

  def decrease_volume(out_volume: possible_decrease_volume)
    raise BucketException.new(message: 'Can not pour out') if out_volume.negative? || out_volume > filled_volume

    @value -= out_volume

    out_volume
  end

  def increase_value(in_volume: possible_increase_value)
    raise BucketException.new(message: 'Can not pour in') if in_volume.negative? || in_volume > free_volume

    @value += in_volume

    in_volume
  end

  def possible_increase_value(in_volume:)
    return in_volume if in_volume <= free_volume

    free_volume
  end

  def possible_decrease_volume(out_volume:)
    return out_volume if out_volume <= filled_volume

    filled_volume
  end
end

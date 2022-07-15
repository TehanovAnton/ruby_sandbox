
require './i_bucket.rb'
require './bucket_exception.rb'

class Bucket < IBucket

  def pour
    @value = volume
  end

  def pour_to(bucket)
    raise BucketException.new(message: "Can not pour to bucket") if value.zero? || bucket.full?

    out_value = decrease_value(bucket.free_volume)
    bucket.increase_value(out_value)
  end

  def pour_from(bucket)
    # перелить сколько возможно
    # сравнить уровни, выставить значение 

    
  end

  protected

  def increase_value(in_value: free_volume)
    raise BucketException.new('Can not increase on value') if in_value.negative?

    
  end

  def decrease_value(out_value: filled_volume)
    raise BucketException.new('Can not decrease empty bucket') if value.zero? || value.negative?
    

  end

  private   
end

class Bucket
  attr_reader :size, :value

  def initialize(size)
    @size = size
    @value = 0
  end

  def pour_from(bucket, volume = free_value)
    @value += bucket.pour_out(volume)
  end

  def empty
    @value = 0
  end

  def feel
    @value = @size
  end

  def free_value
    @size - @value
  end

  def can_pour_from_bucket?(bucket)
    return !bucket.value.zero? && !full?
  end

  def full?
    value == @size
  end

  def empty?
    @value.zero?
  end

  protected

  def pour_out(volume)
    effective_volume = @value - volume

    poured_out_volume = if effective_volume.positive? || effective_volume.zero?
      @value -= volume
      volume
    elsif effective_volume.negative?
      @value = 0
      volume + effective_volume
    end

    return poured_out_volume
  end
end
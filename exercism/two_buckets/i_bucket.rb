
class IBucket
  attr_reader :volume, :value

  def initialize(volume:, value: 0)
    @volume = volume
    @value = value
  end

  def pour_to
    raise NotImplementedError
  end

  def pour_out
    raise NotImplementedError
  end

  def pour
    raise NotImplementedError
  end

  def free_volume
    volume - value
  end

  def filled_volume
    value
  end

  def full?
    volume == value
  end
end
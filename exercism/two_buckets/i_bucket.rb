# frozen_string_literal: true

# IBucket
class IBucket
  attr_reader :volume, :value, :name

  def initialize(volume:, value: 0, name: 'bucket')
    @volume = volume
    @value = value
    @name = name
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

  def empty?
    value.zero?
  end
end

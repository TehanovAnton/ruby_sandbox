require_relative './bucket'

class TwoBucket
  attr_reader :first_bucket, :second_bucket, :required_volume, :start_marker, :goal_bucket, :other_bucket

  def initialize(first_volume, second_volume, required_volume, start_marker)
    @required_volume = required_volume
    @start_marker = start_marker

    @first_bucket = start_bucket([first_volume, second_volume])
    @second_bucket = other_bucket([first_volume, second_volume])

    calculate
  end

  def calculate
    ser_answer if required_match_start_volume?
    
    unless ready?
      prepare_buckets
      first_bucket.pour_to(second_bucket)
    end
  end

  private

  def ser_answer
  end

  def required_match_start_volume?
    required_volume == start_bucket_volume
  end

  def prepare_buckets
    first_bucket.pour if first_bucket.empty?
    second_bucket.pour_out if second_bucket.full?
  end

  def ready?
    [first_bucket.filled_volume, second_bucket.filled_volume].include?(required_volume)
  end

  def buckets
    @first_bucket = Bucket.new(volume: start_bucket_volume)
    @second_bucket = Bucket.new(volume: start_bucket_volume(invers: true))
  end

  def start_bucket_volume(invers: false)
    case start_marker
    when 'one'
      invers ? volumes.last : volumes.first
    when 'two'
      invers ? volumes.first : volumes.last
    end
  end

  def volumes
    @volumes ||= [first_bucket.volume, second_bucket.volume]
  end
end

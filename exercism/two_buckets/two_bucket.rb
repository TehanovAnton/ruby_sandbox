

require_relative './bucket.rb'
require 'pry'

class TwoBucket
  attr_reader :moves,
              :first_size,
              :second_size,
              :first_bucket, 
              :second_bucket,
              :other_bucket,
              :desired_size, 
              :start_bucket_marker

  def initialize(first_size, second_size, desired_size, start_bucket_marker)
    @start_bucket_marker = start_bucket_marker

    @first_size = first_size
    @second_size = second_size

    @first_bucket = Bucket.new(start_bucket_size)
    @second_bucket = Bucket.new(not_start_bucket_size)

    @desired_size = desired_size
    @moves = 0
    @other_bucket = 0
    
    calculate
  end

  def calculate
    pour_from_start_bucket
  end

  private

  def easy_case?
    sizes.include? desired_size
  end

  def easy_case
    @moves = 1 if match_start_bucket?
    @moves = 2 unless match_start_bucket?
  end

  def match_start_bucket?
    case start_bucket_marker
    when 'one'
      diseried_bucket_positions == 1
    when 'two'
      diseried_bucket_positions == 2
    end
  end

  def diseried_bucket_positions
    sizes.index(desired_size) + 1
  end

  def sizes
    [@first_size, @second_size]
  end

  def bucket_values
    [@first_bucket.value, @second_bucket.value]
  end

  def start_bucket_size
    case start_bucket_marker
      when 'one'
        sizes.first
      when 'two'
        sizes.last
    end
  end

  def not_start_bucket_size
    case start_bucket_marker
    when 'one'
      sizes.last
    when 'two'
      sizes.first
    end
  end

  def pour_from_start_bucket
    if easy_case? && not_start_bucket_size
      move(first_bucket.method(:feel))
      move(second_bucket.method(:feel))
      break
    end

    unless ready?
      if can_pour_from_bucket?
        move(second_bucket.method(:pour_from), first_bucket)
        p moves, bucket_values
      end

      prepare_buckets unless if can_pour_from_bucket?
    end

    @other_bucket = second_bucket.value
    p bucket_values, @other_bucket
  end

  def can_pour_from_bucket?
    second_bucket.can_pour_from_bucket?(first_bucket) 
  end

  def prepare_buckets
    move(first_bucket.method(:feel)) if first_bucket.empty?
    move(second_bucket.method(:empty)) if second_bucket.full?
  end

  def move(func, *args)
    func.call(*args) unless args.empty?
    func.call if args.empty?

    @moves += 1
  end

  def ready?
    bucket_values.include?(@desired_size)
  end
end

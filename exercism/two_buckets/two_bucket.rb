# frozen_string_literal: true

require_relative './bucket'
require 'pry'
require 'pry-nav'

class TwoBucket
  attr_reader :first_bucket, :second_bucket, :required_volume, :start_marker, :moves

  def initialize(first_volume, second_volume, required_volume, start_marker)
    @start_marker = start_marker
    @first_volume = first_volume
    @second_volume = second_volume
    @required_volume = required_volume
    @moves = 0
    buckets

    calculate
    status
  end

  def calculate
    easy_case_by_first_bucket_volume
    easy_case_by_second_bucket_volume

    until ready?
      prepare_buckets
      bucket_action(second_bucket, action: first_bucket.method(:pour_to))
    end
  end

  def easy_case_by_first_bucket_volume
    return unless required_match_start_volume?

    bucket_action(action: first_bucket.method(:pour))
  end

  def easy_case_by_second_bucket_volume
    return unless required_match_not_start_volume?

    bucket_action(action: second_bucket.method(:pour))
    bucket_action(action: first_bucket.method(:pour))
  end

  def status
    puts "\nmoves:#{moves}, goal_bucket:#{goal_bucket}, other_bucket:#{other_bucket}"
  end

  def goal_bucket
    match_required_volume = ->(b) { b.filled_volume == required_volume }
    bucket_by_condition(match_required_volume).name
  end

  def other_bucket
    not_match_required_volume = ->(b) { b.filled_volume != required_volume }
    bucket_by_condition(not_match_required_volume).filled_volume
  end

  private

  def bucket_by_condition(condition)
    [first_bucket, second_bucket].find { |b| condition.call(b) }
  end

  def bucket_action(*params, action:)
    action.call(*params)

    first_bucket.status
    second_bucket.status
    puts '----------------------------------------'

    @moves += 1
  end

  def set_answer
    @moves = 2
  end

  def required_match_start_volume?
    required_volume == start_bucket_volume
  end

  def required_match_not_start_volume?
    required_volume == start_bucket_volume(invers: true)
  end

  def prepare_buckets
    bucket_action(action: first_bucket.method(:pour)) if first_bucket.empty?
    bucket_action(action: second_bucket.method(:pour_out)) if second_bucket.full?
  end

  def ready?
    [first_bucket.filled_volume, second_bucket.filled_volume].include?(required_volume)
  end

  def buckets
    @first_bucket = Bucket.new(volume: start_bucket_volume, name: first_bucket_name)
    @second_bucket = Bucket.new(volume: start_bucket_volume(invers: true), name: first_bucket_name(invers: true))
  end

  def start_bucket_volume(invers: false)
    case start_marker
    when 'one'
      invers ? volumes.last : volumes.first
    when 'two'
      invers ? volumes.first : volumes.last
    end
  end

  def first_bucket_name(invers: false)
    case start_marker
    when 'one'
      invers ? 'two' : 'one'
    when 'two'
      invers ? 'one' : 'two'
    end
  end

  def volumes
    @volumes ||= [@first_volume, @second_volume]
  end
end


class TwoBucket
  attr_reader :moves, :otoher_bucket, :first_size, :second_size, :sizes, :desired_size, :start_bucket

  def initialize(first_size, second_size, desired_size, start_bucket)
    @first_size = first_size
    @second_size = second_size
    @sizes = [@first_size, @second_size]
    @desired_size = desired_size
    @start_bucket = start_bucket

    @moves = 0
    @other_bucket = 0

    calculate
  end

  def calculate
    easy_case if sizes.include? desired_size
  end

  private

  def easy_case
    diseried_bucket = sizes.index desired_size + 1
    match_start_bucket?(diseried_bucket) ? 1 : 2
  end

  def match_start_bucket?(diseried_bucket)
    case start_bucket
    when 'one'
      diseried_bucket == 1
    when 'two'
      diseried_bucket == 2
    end
  end
end

class Circle
  attr_reader :r

  def initialize(r)
    @r = r
  end

  def calculate_square
    3.14 * r * r
  end
end

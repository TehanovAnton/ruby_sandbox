# ab / 2
class Triangle
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def calculate_square
    a * b / 2
  end
end

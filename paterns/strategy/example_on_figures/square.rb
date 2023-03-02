class Square
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def calculate_square
    a * b
  end
end
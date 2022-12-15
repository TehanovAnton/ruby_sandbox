
# a * b
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

class Circle
  attr_reader :r

  def initialize(r)
    @r = r
  end

  def calculate_square
    3.14 * r * r
  end
end

class FigureSquareCalculator
  attr_reader :figure

  def initialize(figure)
    @figure = figure
  end

  def calculate_square
    figure.calculate_square
  end
end

figures = [Circle.new(3), Triangle.new(2, 3), Square.new(2, 3)]

figures.each do |f|
  fg_square_calc = FigureSquareCalculator.new(f)
  puts "#{fg_square_calc.class}::#{fg_square_calc.figure.class} - #{fg_square_calc.calculate_square}"
end

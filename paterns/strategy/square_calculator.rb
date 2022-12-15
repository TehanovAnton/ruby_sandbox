
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

class Figure
  attr_reader :figure

  def initialize(figure_class, figure_params)
    @figure = figure_class.new(*figure_params)
  end

  def calculate_square
    figure.calculate_square
  end
end

figures = [{ class: Circle, params: [3] }, { class: Triangle, params: [2, 3]}, { class: Square, params: [2, 3]}]

figures.each do |f|
  fg = Figure.new(f[:class], f[:params])
  puts "#{fg.class}::#{fg.figure.class} - #{fg.calculate_square}"
end

require_relative '../strategy/example_on_figures/square'
require_relative '../strategy/example_on_figures/triangle'
require_relative '../strategy/example_on_figures/circle'

class FigureCreater
  attr_reader :params, :figure

  def initialize(params)
    @params = params
  end

  def create_figure
    puts 'Why dont you implement it?'
  end

  def figure_square
    create_figure
    puts "#{figure.class}: #{figure.calculate_square}" 
  end
end

class CircleCreater < FigureCreater
  def create_figure()
    @figure = Circle.new(*params)
  end
end

class TriangleCreater < FigureCreater
  def create_figure()
    @figure = Triangle.new(*params)
  end
end

class SquareCreater < FigureCreater
  def create_figure()
    @figure = Square.new(*params)
  end
end

figures_data = [{ class: CircleCreater, params: [3] }, { class: TriangleCreater, params: [2, 3]}, { class: SquareCreater, params: [2, 3]}]

figures_data.each do |fd|
  fd[:class].new(fd[:params]).figure_square
end
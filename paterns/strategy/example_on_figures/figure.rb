class Figure
  attr_reader :figure

  def initialize(figure_class, figure_params)
    @figure = figure_class.new(*figure_params)
  end

  def calculate_square
    figure.calculate_square
  end
end
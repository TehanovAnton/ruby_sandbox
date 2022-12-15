require_relative 'circle.rb'
require_relative 'square.rb'
require_relative 'triangle.rb'
require_relative 'figure.rb'

figures = [{ class: Circle, params: [3] }, { class: Triangle, params: [2, 3]}, { class: Square, params: [2, 3]}]

figures.each do |f|
  fg = Figure.new(f[:class], f[:params])
  puts "#{fg.class}::#{fg.figure.class} - #{fg.calculate_square}"
end

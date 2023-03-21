require 'colorize'
require 'date'

CELL_FORMAT = '%2.2s'.freeze

date = Date.today
month_start_date = Date.new(date.year, date.month, 1)
month_end_date = Date.new(date.year, date.month, -1)

puts date.strftime('%B %Y').center(20)

days = (1..month_end_date.day).to_a
days.prepend(*Array.new(month_start_date.wday))
days.prepend(*Date::DAYNAMES)
days.map! do |number|
  CELL_FORMAT % number
end

current_day_index = date.day + 7 + month_start_date.wday - 1
days[current_day_index] = days[current_day_index].colorize(background: :white, color: :black)

days.each_slice(7) do |week|
  puts week.join(' ')
end

puts

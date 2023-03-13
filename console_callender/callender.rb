require 'colorize'
require 'date'
require 'pry'
require_relative 'callender_console_writer'
require_relative 'day_names_formater'

class Callender
  attr_reader :callender_day

  def initialize
    @date = Date.today
    @month_start = Date.new(@date.year, @date.month, 1)
    @day_names = DayNamesFormater.new(Date::DAYNAMES, :en).format_days
    @console_writer = CallenderConsoleWriter.new(@date, @day_names)
  end

  def call
    init_callender_day

    @console_writer.write_month
    @console_writer.write_day_names

    while @callender_day != Date.new(@date.year, @date.month, -1)
      @console_writer.write_day(callender_day_output, callender_day_name)
      @callender_day += 1
    end

    @console_writer.write_day(callender_day_output, callender_day_name)
  end

  private

  def callender_day_name
    @day_names[@callender_day.wday]
  end

  def init_callender_day
    @callender_day = @month_start
    @callender_day -= 1 while @day_names[callender_day.wday] != @day_names.first
  end

  def callender_day_output
    output = '  '
    return output if callender_day < @month_start
    return " #{callender_day.day}" if callender_day.day < 10

    callender_day.day.to_s
  end
end

puts Callender.new.call

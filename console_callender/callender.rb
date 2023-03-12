require 'colorize'
require 'date'
require 'pry'

class Callender
  def initialize
    @date = Date.today
    @month_start = Date.new(@date.year, @date.month, 1)
    @days = {}
  end

  def call
    init_days
    init_callender_day

    while @callender_day != Date.new(@date.year, @date.month, -1)
      callender_day_output(@callender_day)
      @callender_day += 1
    end
    callender_day_output(@callender_day)

    print "     #{Date::MONTHNAMES[@date.month]} #{@date.year}\n"

    until @days.values.reject(&:empty?).empty?
      Date::DAYNAMES.each do |day_name|
        day = @days[day_name].shift || ''
        day = day.colorize(background: :white, color: :black) if @date.day.to_s == day.to_i.to_s

        print day
        print "\n" if day_name == 'Saturday'
        print ' ' if day_name != 'Saturday'
      end
    end

    @output
  end

  private

  def init_days
    Date::DAYNAMES.each do |day_name|
      short_name = day_name[0, 2]
      short_name += "\n" if day_name == 'Saturday'

      @days[day_name] = [short_name]
    end
  end

  def init_callender_day
    callender_day = @month_start
    callender_day -= 1 while Date::DAYNAMES[callender_day.wday] != 'Sunday'

    @callender_day = callender_day
  end

  def callender_day_output(callender_day)
    callender_day_name = Date::DAYNAMES[callender_day.wday]

    unless callender_day_name
      short_name = callender_day_name[0, 2]
      short_name += "\n" if callender_day_name == 'Saturday'
      @days[callender_day_name] = [short_name]
    end

    return @days[callender_day_name] << '  ' if callender_day < @month_start

    output = callender_day.day < 10 ? " #{callender_day.day}" : callender_day.day.to_s
    @days[callender_day_name] << output
  end
end

puts Callender.new.call

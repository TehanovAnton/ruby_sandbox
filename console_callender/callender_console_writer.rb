class CallenderConsoleWriter
  def initialize(date, day_names)
    @date = date
    @day_names = day_names
  end

  def write_day(day, day_name)
    day = day.colorize(background: :white, color: :black) if @date.day.to_s == day.to_i.to_s

    print day
    print "\n" if day_name == @day_names.last
    print ' ' if day_name != @day_names.last
  end

  def write_day_names
    @day_names.each do |day_name|
      print day_name[0, 2]
      print ' ' if day_name != @day_names.last
      print "\n" if day_name == @day_names.last
    end
  end

  def write_month
    print "     #{Date::MONTHNAMES[@date.month]} #{@date.year}\n"
  end
end

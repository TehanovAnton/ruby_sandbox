class DayNamesFormater
  LOCATION_START_NAME = {
    by: 'Monday',
    en: 'Sunday'
  }.freeze

  def initialize(day_names, location)
    @day_names = day_names
    @location = location
    @format_days = []
  end

  def format_days
    return @format_days unless @format_days.empty?

    index = @day_names.find_index(LOCATION_START_NAME[@location])
    7.times do
      @format_days.push(@day_names[index % 7])
      index += 1
    end

    @format_days
  end
end

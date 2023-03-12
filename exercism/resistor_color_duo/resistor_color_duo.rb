class ResistorColorDuo
  COLORS_VALUES = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }.freeze

  class << self
    def value(colors)
      instance = new(colors)
      instance.value
    end
  end

  def initialize(colors_array)
    @colors_array = colors_array
    @value_string = ''
  end

  def value
    colors.each do |color|
      color_sym = color.to_sym
      @value_string += COLORS_VALUES[color_sym].to_s
    end

    @value_string.to_i
  end

  private

  def colors
    @colors ||= @colors_array.first(2)
  end
end

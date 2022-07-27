# frozen_string_literal: true

class Luhn
  class << self
    def valid?(card_number)
      card_number.gsub!(/ /, '')
      return if card_number.size <= 1 || card_number.match?(/\D/)

      luhn_algorithm(card_number)
    end

    def luhn_algorithm(card_number)
      card_number
        .split('')
        .map(&:to_i)
        .reverse
        .map.with_index(&method(:double_digits_even_position))
        .sum
        .modulo(10).zero?
    end

    def double_digits_even_position(element, index)
      return element unless (index + 1).modulo(2).zero?

      element *= 2
      return element if element <= 9

      element - 9
    end
  end
end

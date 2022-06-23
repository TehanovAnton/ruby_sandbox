
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
      .modulo(10) == 0
    end
  
    def double_digits_even_position(el, i)
      return el unless (i + 1).modulo(2).zero?
      
      el *= 2
      return el if el <= 9
  
      el - 9
    end
  end
end

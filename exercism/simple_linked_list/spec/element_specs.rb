# frozen_string_literal: true

require_relative '../element'

RSpec.describe Element do
  describe '#each' do
    let!(:first_element) { Element.new(1) }
    let!(:second_element) { first_element.next_el = Element.new(2) }
    let!(:third_element) { second_element.next_el = Element.new(3) }
    let!(:fourth_element) { third_element.next_el = Element.new(4) }
    let!(:fifth_element) { fourth_element.next_el = Element.new(5) }
    let!(:arr) { [] }

    it 'fills arr' do
      first_element.each { |element| arr << element.datum }
      expect(arr).to eq([1, 2, 3, 4, 5])
    end
  end
end

# frozen_string_literal: true

require 'pry-nav'

class Element
  include Enumerable

  attr_reader :datum
  attr_accessor :next_el, :previous

  def initialize(datum)
    @datum = datum
    @next_el = nil
    @previous = nil
  end

  def each(&block)
    block.call(self)

    next_el&.each(&block)
  end
end

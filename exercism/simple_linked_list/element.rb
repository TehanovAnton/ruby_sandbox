# frozen_string_literal: true

class Element
  attr_reader :datum
  attr_accessor :next, :previous

  def initialize(datum)
    @datum = datum
    @next = nil
    @previous = nil
  end
end

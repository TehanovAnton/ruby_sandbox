class Element
  attr_reader :datum

  def initialize(datum)
    @datum = datum
    @next = nil
    @previous = nil
  end
end
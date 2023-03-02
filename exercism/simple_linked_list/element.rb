class Element
  attr_reader :datum, :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end

  def next=(element)
    @next = element
  end
end

# e = Element.new(1)
# p "#{e.inspect}"

# e.next = Element.new(2)
# p "#{e.inspect}"
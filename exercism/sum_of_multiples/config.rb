class Config
  attr_reader :value

  def initialize(limit_number, multiples)
    @value = {
      limit_number: limit_number,
      multiples: multiples
    }
  end
end

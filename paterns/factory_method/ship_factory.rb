require './transport_factory'
require './ship'

class ShipFactory
  include TransportFactory

  def transporter
    Ship.new
  end
end
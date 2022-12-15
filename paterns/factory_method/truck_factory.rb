require './transport_factory'
require './truck'

class TruckFactory
  include TransportFactory

  def transporter
    Truck.new
  end
end
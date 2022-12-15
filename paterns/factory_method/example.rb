
require './truck_factory.rb'
require './ship_factory.rb'

truck = TruckFactory.new.transporter
truck.hello

ship = ShipFactory.new.transporter
ship.hello

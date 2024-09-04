class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(attrs)
    @name = attrs[:name]
    @address = attrs[:address]
    @phone = attrs[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.type
    if 
      :antique
      vehicle.register(:antique, 25)
    if 
      :ev
      vehicle.register(:ev, 200)
    else
      vehicle.register(:regular, 100)
    end
  end


end

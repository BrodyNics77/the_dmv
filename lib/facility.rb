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
end

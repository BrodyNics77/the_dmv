class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(name, address, phone, services)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_services(service)
    @services << service
  end

  def register_vehicles(vehicle)
    case vehicle.type
    when :antique
      vehicle.register(:antique, 25)
    when :ev
      vehicle.register(:ev, 200)
    else
      vehicle.register(:regular, 100)
    end
  end

  def administer_written_test(registrant)
    if registrant.has_permit? && registrant.age >= 16
      registrant.pass_written_test
      registrant.pass_road_test
      registrant.issue_license
    end
  end

  def renew_license(registrant)
    if registrant.has_license?
      registrant.renew_license
    end
  end
end

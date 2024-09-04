require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

Rspec.describe Vehicle_factory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
end

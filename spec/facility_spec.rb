require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])

      expect(@facility_2.services).to eq([])
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Renew Drivers License')
      @facility_2.add_service('Vehicle Registration')
      expect(@facility_2.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registers vehicle' do
    it 'can register vehicles' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#register_vehicle' do
    it 'registers vehicle based on type' do
      vehicle1 = double("Vehicle", type: :antique)
      vehicle2 = double("Vehicle", type: :ev)
      vehicle3 = double("Vehicle", type: :regular)

      expect(vehicle1).to receive(:register).with(:antique, 25)
      expect(vehicle2).to receive(:register).with(:ev, 200)
      expect(vehicle3).to receive(:register).with(:regular, 100)

      @facility_1.register_vehicle(vehicle1)
      @facility_1.register_vehicle(vehicle2)
      @facility_1.register_vehicle(vehicle3)
      @facility_2.register_vehicle(vehicle1)
      @facility_2.register_vehicle(vehicle2)
      @facility_2.register_vehicle(vehicle3)
    end
  end

  describe '#administer_written_test' do
    it 'can administer written test to eligible registrants' do
      expect(registrant).to receive(:pass_written_test)

      @facility_1.administer_road_test(registerant)
      @facility_2.administer_road_test(registerant)
    end
  end
  
  describe '#administer_license_test' do
    it 'can administer license test to eligible registrants' do 
      expect(registrant).to receive(:renew_license)

      @facility_1.renew_license(registerant)
      @facility_2.renew_license(registerant)
    end
  end
end
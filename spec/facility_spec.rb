require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'registers vehicles based on type' do
      vehicle1 = double("Vehicle", type: :antique)
      vehicle2 = double("Vehicle", type: :ev)
      vehicle3 = double("Vehicle", type: :regular)

      expect(vehicle1).to receive(:register).with(:antique, 25)
      expect(vehicle2).to receive(:register).with(:ev, 200)
      expect(vehicle3).to receive(:register).with(:regular, 100)

      @facility.register_vehicle(vehicle1)
      @facility.register_vehicle(vehicle2)
      @facility.register_vehicle(vehicle3)
    end
  end

  describe 'can administer_written_test' do
    it 'administers written test to eligible registrants' do
      registrant = double("Registrant", has_permit?: true, age: 16)

      expect(registrant).to receive(:pass_written_test)

      @facility.administer_written_test(registrant)
    end
  end

  describe 'can administer_road_test' do
    it 'can administer road test to eligible registrants' do
      registrant = double("Registrant", passed_written_test?: true)

      expect(registrant).to receive(:renew_license)

      @facility.renew_license(registrant)
    end
  end
end

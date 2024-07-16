require 'spec_helper'

RSpec.describe @registrant do
    before(:each) do
      Registrant.new({name: 'Brody, 25, true'})
      Registrant.new({name: 'Tj, 18, false'})
      Registrant.new({name: 'Theodora, 14, false'})
end

describe '#initialize' do
    it 'can initialize' do
        @registrants.each do |registrant|
        expect(registrant).to be_an_instance_of(Registrant)
        end
    end
end

describe '#add registrants' do
    it 'can add new registrants' do
        new_registrant = Registrant.new({name: 'Alice', age: 30, active: true})
        @registrants << new_registrant
  
        expect(@registrants).to include(new_registrant)
        end
    end
end
require 'spec_helper'

RSpec.describe @registrant do
    before(:each) do
      @registrant = Registrant.new({name: 'Brody, 25, true'})
      @registrant = Registrant.new({name: 'Tj, 18, false'})
      @registrant = Registrant.new({name: 'Theodora, 14, false'})
end

describe '#initialze' do
    it 'can initialze' do
        expect(@registrant).to be_an_instance_of(Registrant)
        expect(@registrant.) to eq([])
    end
end

describe "#add registrants" do
    it 'can add new registrants' do
        expect()
    end
end
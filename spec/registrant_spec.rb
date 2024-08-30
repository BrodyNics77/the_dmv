require './lib/registrant'

Rspec.describe Registrant do
    it 'is a registrant' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1.name).to eq("Bruce")
        expect(registrant_1.age).to eq(18)
        expect(registrant_1.permit).to eq(true)
        expect(registrant_2.name).to eq("Penny")
        expect(registrant_2.age).to eq(15)
        expect(registrant_2.permit).to eq(false)
    end

    it "has license data" do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        

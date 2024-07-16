class Registrant
    attr_reader :name, :age, :active

    def initialize(params = {})
        @name = params[:name]
        @age = params[:age]
        @active = params[:active]
    end
end
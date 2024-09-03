class Registrant
    attr_reader :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        @permit = false
    end

    def earn_permit
        @permit = true
    end
end
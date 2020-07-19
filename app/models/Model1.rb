#class for Model1 goes here
#Feel free to change the name of the class
class Captain

    attr_accessor :name, :age, :experience

    @@all = []

    def initialize(name, age, experience)
        @name = name
        @age = age
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def sign_contract
        CaptainCompany.new(self, company)
    end

    def assign_to_ship(ship)
        Ship.all.select do |ship|
            if ship.name == ship
                ship.captain == self
            end
        end
    end

    def find_contracts(company_ins)
        CaptainCompany.all.select {|cc| cc.captain == self}
    end


    

end

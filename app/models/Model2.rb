#class for Model2 goes here
#Feel free to change the name of the class
class Ship

    attr_accessor :name, :brand, :type, :captain, :company

    @@all = []

    def initialize(name, brand, type, captain=nil, company)
        @name = name
        @brand = brand
        @type = type
        @captain = captain
        @company = company
        @@all << self
    end

    def self.all
        @@all
    end

    def find_owner
        self.all.select {|ship| ship.name == self}
    end
    

end
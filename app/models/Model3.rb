#class for Model3 goes here
#Feel free to change the name of the class
class Company

    attr_accessor :name, :brand, :type, :captain, :company

    @@all = []

    def initialize(name, size, founded, country)
        @name = name
        @size = size
        @founded = founded
        @country = country
        @@all << self
    end

    def self.all
        @@all
    end




end

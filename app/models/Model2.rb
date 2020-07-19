#class for Model2 goes here
#Feel free to change the name of the class
class Movie
    @@all = []
    attr_accessor :name, :year, :studio
    def initialize(name, year, studio)
        @name = name
        @year = year
        @studio = studio
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end


end

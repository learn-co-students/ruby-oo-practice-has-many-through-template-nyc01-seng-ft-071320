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

    def self.exist?(movie)
        Movie.all.find {|title| title.name.downcase == movie.downcase}
    end

    def self.all
        @@all
    end

    def self.database
        Movie.all.map {|title| title.name.upcase}.sort
    end

end

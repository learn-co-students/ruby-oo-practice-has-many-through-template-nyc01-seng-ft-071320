#class for Model3 goes here
#Feel free to change the name of the class
class Theater
    @@all = []

    attr_accessor :name, :now_playing, :tickets_sold
    def initialize(name)
        @name = name
        @now_playing= []
        @tickets_sold = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.valid?(movie_theater)
        Theater.all.find {|theater| theater.name.downcase == movie_theater}
    end

    def new_movie(movie)
        @now_playing << movie
    end

    def buy_movie_ticket(person, movie)
        time = Time.now
        purchased = time.strftime("%m/%d/%y @ %I:%M %p")
        ticket = {}
        ticket[:person] = person
        ticket[:cost] = 15.95
        ticket[:movie] = movie
        ticket[:theater] = self.name
        ticket[:time] = purchased
        @tickets_sold << ticket
       # "You have successfully purchased a ticket for #{movie.name.upcase} at #{self.name}"
    end

    def find_ticket(customer)
        tickets_sold.select do |ticket|
            ticket.person.name == customer
        end
    end
end

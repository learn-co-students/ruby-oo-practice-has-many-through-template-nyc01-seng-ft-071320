#class for Model1 goes here
#Feel free to change the name of the class
class MovieGoer
    @@all = []
    attr_accessor :name, :selected_movie
    attr_reader :mgr, :producer
    def initialize(name, mgr = false, producer = false)
        @name = name
        @mgr = mgr
        @producer = producer
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def movies_at_theater(theater)
        theater.now_playing.map do |movie|
            movie.name.upcase
        end.sort
    end

    def all_movies
        Theater.all.map do |movie|
            movie.now_playing.map do |movie_name|
                movie_name.name
            end
        end.flatten.uniq.sort
    end


    def see_a_movie(title, theater)
        if(movies_at_theater(theater).include?(title.upcase))
            @selected_movie = Movie.all.select do |movie|
                movie.name.upcase == title.upcase
            end
            theater.buy_movie_ticket(self, @selected_movie[0])
        else
           puts "Sorry, #{title.upcase} is not playing at #{theater.name}."
        end
    end

    def view_ticket_stubs
        all_movies = Theater.all.map do |location|
            location.tickets_sold.select do |sold|
                sold[:person] == self
            end
        end.flatten
        puts "Ticket Stub"
        puts "_____________________________________________"
        puts " "
        list = all_movies.map do |stub|
            ticket_info = "PURCHASE DATE: #{stub[:time]},"
            ticket_info += " CUSTOMER: #{stub[:person].name },"
            ticket_info += " PRICE: #{stub[:cost].to_s},"
            ticket_info += " MOVIE: #{stub[:movie].name },"
            ticket_info += " THEATER: #{stub[:theater]}"
        end.sort {|a,b| b<=>a}
        puts list
        puts "______________________________________________"
    end

end

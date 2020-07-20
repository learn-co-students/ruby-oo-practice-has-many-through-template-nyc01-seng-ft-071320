require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end



# List of Movies
titanic = Movie.new("Titanic", 1998, "Touchstone")
the_help = Movie.new("The Help", 2010, "Touchstone")
hangover = Movie.new("The Hangover", 2008, "Paramount")
mean_girls = Movie.new("Mean Girls", 2002, "FOX")
bridesmaids = Movie.new("Bridesmaids", 2011, "Universal Pictures")
love_simon = Movie.new("Love Simon", 2018, "FOX")
knives_out = Movie.new("Knives Out", 2019, "Lionsgate")
hustlers = Movie.new("Hustlers", 2019, "Nuyorican Productions")
jojo_rabbit = Movie.new("Jojo Rabbit", 2019, "Defender Films")

#List of Movie Theaters
amc = Theater.new("AMC")
pheonix = Theater.new("Pheonix")

#Importing movies into theater
amc.new_movie(titanic)
amc.new_movie(hangover)
amc.new_movie(hustlers)
amc.new_movie(jojo_rabbit)
amc.new_movie(bridesmaids)
pheonix.new_movie(knives_out)
pheonix.new_movie(hangover)
pheonix.new_movie(mean_girls)
pheonix.new_movie(love_simon)
pheonix.new_movie(hustlers)











# To get a list of current movies playing, press 1."
# puts "To find movies by theater, press 2"
# puts "To purchase tickets for a movie, press 3"
# @response = gets.chomp.to_i
# end

# def run
#   opening
#   if(response == 1)





#leave this here to ensure binding.pry isn't the last line

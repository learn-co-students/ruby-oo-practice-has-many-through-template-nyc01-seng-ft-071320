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




def run 
  puts "Welcome to MovieFone!".red.bold
  puts "Please select y/n if you would like to create an account.".blue
  account = gets.chomp
  if(account.downcase == "y")
    puts "Are you signing up as a Customer or Employee?"
    status = gets.chomp
    puts "Please enter your name"
    name = gets.chomp
    if(status.downcase == "employee")
      puts "Are you a manager of a theater? y/n"
      mgr = gets.chomp
      if (mgr.downcase == 'y')
        puts "Please enter Manager password"
        passcode = gets.chomp
        if(passcode.downcase == "owner")
          puts "Access Granted"
          mgr = true
        else
          puts "Sorry incorrect password"
          run
        end
      end
      puts "Are you a Producer? y/n"
      answer = gets.chomp
      if(answer.downcase == 'y')
        puts "Please enter Producer password"
        passcode = gets.chomp
        if(passcode.downcase == "producer")
          puts "Access Granted"
          prod = true
        else
          puts "Sorry inccorrect password."
          run
        end
      end
    end
    user = MovieGoer.new(name, mgr, prod )
    run

  else
    puts "Please enter your name"
    user_name= gets.chomp
    user = MovieGoer.all.find {|user| user.name.downcase == user_name.downcase}
    if(user)
      puts "You are successfully logged in."
    else
      puts "Could not verify your information."
      puts "----------------------------------------"
      run
    end

    while(true)
      puts "\n"
      puts "\n"
    puts "To get a list of all the movies playing, press 1"
    puts "To get a list of all the movies playing by location, press 2."
    puts "To purchase a ticket for a show, press 3."
    puts "To view all your ticket stubs, press 4"
    puts "To change user, press 5."
    puts "To add a movie to your theater, press 6. (Must have credentials)"
    puts "To add a movie, press 7. (Must have credentials)"
    puts "To check the database of movies, press 8"
    puts "To close this app, press 10."
    selection = gets.chomp.to_i
    if(selection == 1)
      puts "\nHere is a list of all the movies playing in your area:".green.bold
      puts user.all_movies
    elsif(selection == 2)
      puts "\nCurrently there are movies playing at ".green.bold
      Theater.all.count do |location, index|
        puts "#{index}. #{location.name}\n"
      end
      puts "What location would you like to view movies at?".bold
      location = gets.chomp
      theater = Theater.all.find {|theater_location| theater_location.name.upcase == location.upcase}
      if(theater)
        puts "\n**************Currently playing at #{theater.name} Theater***********".red
        puts user.movies_at_theater(theater)
        puts "-------------------------------------".red
      else
        puts "\nSorry, #{location} Theater does not exist in our database.".bold
      end
    elsif(selection == 3)
      puts "Please enter the name of the movie you would like to see.".bold
      show = gets.chomp
      puts "Enter the location you would like to watch the movie at.".bold
      location = gets.chomp
      theater = Theater.all.find {|theater_location| theater_location.name.upcase == location.upcase}
      if(theater)
        if(user.see_a_movie(show, theater))
          puts "⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️"
          puts "You have successfully purchased a ticket for #{show.upcase} at #{location.upcase}".bold
          puts "⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️•🎥•⭐️"
        end
      else
        puts "Sorry, that theater does not exist on MovieFone.".red
      end
    elsif(selection == 4)
      puts user.view_ticket_stubs
    elsif(selection == 5)
      run
    elsif(selection == 6)
      if(user.mgr == true)
        puts "Enter name of your movie theater".bold
        movie_theater = gets.chomp
        theater = Theater.valid?(movie_theater)
        if(theater)
          puts "Enter name of movie you would like to add to your theater".bold
          movie_title = gets.chomp
          puts "You entered #{movie_title}. Is that correct? y/n".bold
          confirm = gets.chomp
          if(confirm.downcase == "y")
            movie_record = Movie.exist?(movie_title)
            if(movie_record)
            theater.new_movie(movie_record)
            else
              puts "Movie does not exist".bold
            end
          else
            puts "Cancelled".red
          end
        end
      else
        puts "You do not have the correct credentials.".red
      end
    elsif(selection == 7)
      if(user.producer == true)
        puts "Enter name of Movie".bold
        name = gets.chomp
        title = Movie.exist?(name)
        if(!title)
          puts "Enter year it was made".bold
          year = gets.chomp.to_i
          puts "Enter the production company".bold
          studio = gets.chomp
          Movie.new(name, year, studio)
        else
          puts "Sorry that title already exists in our records".red
        end
      else
        puts "You do not have the correct credentials.".red
      end
    elsif(selection == 8)
      puts "\n"
      puts Movie.database
    elsif(selection == 10)
      puts "Thank you for visiting MovieFone. Have a great day!".bold.blue
      exit(true)
    end
  end
end
end

run







# To get a list of current movies playing, press 1."
# puts "To find movies by theater, press 2"
# puts "To purchase tickets for a movie, press 3"
# @response = gets.chomp.to_i
# end

# def run
#   opening
#   if(response == 1)





#leave this here to ensure binding.pry isn't the last line

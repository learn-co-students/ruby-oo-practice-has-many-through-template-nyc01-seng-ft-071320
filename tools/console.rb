require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


karan = Doctor.new("Karan S. Chauhan", "Internal Medicine", 200)
nazia = Doctor.new("Nazia T", "OBG/YN", 450)

jonny = Patient.new("Jonathan", "Flu", "40000")
Appointment.new(karan, jonny)





binding.pry
0 #leave this here to ensure binding.pry isn't the last line

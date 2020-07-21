#class for Model3 goes here
#Feel free to change the name of the class


class Appointment
    attr_reader :doctor, :patient
    @@all = []

    def initialize(doctor, patient)
        @doctor = doctor
        @patient = patient
        @@all << self
    end

    def self.all
        @@all
    end
  
end

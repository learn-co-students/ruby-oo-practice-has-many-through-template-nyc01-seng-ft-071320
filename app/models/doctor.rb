#class for Model1 goes here
#Feel free to change the name of the class


class Doctor
    attr_reader :name, :field, :cost
    @@all = []

    def initialize(name, field, cost)
        @name = name
        @field = field
        @cost = cost
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select{|a| a.doctor == self}
    end

end

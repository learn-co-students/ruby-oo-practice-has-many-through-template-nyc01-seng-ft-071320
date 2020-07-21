#class for Model2 goes here
#Feel free to change the name of the class


class Patient
    attr_reader :name, :ailment, :income
    @@all = []

    def initialize(name, ailment, income)
        @name = name
        @ailment = ailment
        @income = income
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select(|a| a.patient == self)
    end

end

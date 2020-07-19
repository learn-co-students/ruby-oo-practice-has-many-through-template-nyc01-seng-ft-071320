class CaptainCompany

    attr_accessor :capitain, :company

    @@all = []

    def initialize (captain, company)
        @captain = captain
        @company = company
        @@all < self
    end

    def self.all
        @@all
    end



end

class Listing
    # Listing belongs to Agent
    attr_reader :location
    attr_accessor :status, :price, :agent
    @@all = []
    def initialize(location, price, status="for sale")
        @location = location
        @price = price
        @status = status
        @@all << self
    end
    def self.all
        @@all
    end 
end
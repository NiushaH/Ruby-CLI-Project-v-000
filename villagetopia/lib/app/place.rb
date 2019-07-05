class VillagetopiaCLI::Place
attr_accessor :description_of_place, :rank, :family_type, :state, :city, :city_webpage

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
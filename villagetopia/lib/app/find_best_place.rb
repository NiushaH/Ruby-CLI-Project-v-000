class VillagetopiaCLI::FindBestPlace
attr_accessor :name, :description, :rank, :family_type, :city, :state, :city_webpage

  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
   @@all
  end

  def self.best_place
    puts "\n\nNow, Villagetopia will look through it's data to suggest places in the USA that offer resources and a community that could be your family's ideal Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)
  end

end
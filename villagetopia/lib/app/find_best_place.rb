class FindBestPlace
#this is where code for matching user's profile with data will go

  def self.best_place
      puts "\n\nNow, Villagetopia will look through it's data to suggest places in the USA that offer resources and a community that could be your family's ideal Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)
  end

end
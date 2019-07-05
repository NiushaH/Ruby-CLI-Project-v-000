class VillagetopiaCLI::YourVillagetopia
  attr_reader :city, :state, :city_webpage, :school_name, :description_of_place, :learning_profile, :rank


  def self.find_best_place
    puts "\n\nNow, Villagetopia will look through it's data to suggest places in the USA that offer resources and a community that could be your family's ideal Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)
  end

  def self.villagetopia_results
    #should return a list of locations (city, state) where family needs are
    #  best supported with an index ranked in order of school proximity to
    #  best place for single or double parent household to live

    # puts "Here is a list of US locations ranked in order of school proximity to the town ranked best place to live for your family structure and needs.  We hope this information helps you narrow down the best place for your next place to call home.  To learn more about the city and the schools available to support your children, please key in the associated number for the location you're most interested, or type more the entire list.".scan(/(.{1,60})(?:\s|$)/m)

    puts <<-DOC.gsub /^\s*/, ''

* This list is made by looking at "best place list" then looking for matches in  *
* learning need areas identified in family profile and creating a list that will *
* be printed in order of best place ranking.                                     *

# Give option to sort by state instead of by ranked place to live??

      1. Make Your Best Life, US state
           #Name of School (learning need)
           #Name of School (learning need)
           #Name of School (learning need)
           #Name of School (learning need)

///Choose rank you want to learn more about (1,2,3, etc.)
Give option to choose to learn more about city or listed school

      2. 2nd Best Place to Plant Roots, US state
           #No Learning Needs


    DOC

    villagetopia_1 = self.new
    villagetopia_1.city = "City"
    villagetopia_1.state = "ST"
    villagetopia_1.url = "city's website"

    villagetopia_2 = self.new
    villagetopia_2.city = "City"
    villagetopia_2.state = "ST"
    villagetopia_2.url = "city's website"
  end

  def encouragement
    puts "We truly hope Villagetopia has helped you find your family's next best place to live, plant roots, and live your best life as your children grow!".scan(/(.{1,60})(?:\s|$)/m)
  end


end
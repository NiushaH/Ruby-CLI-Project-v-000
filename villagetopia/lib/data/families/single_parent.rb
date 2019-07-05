class VillagetopiaCLI::SingleParent
attr_accessor :description_of_place, :rank, :family_type, :city, :state, :city_webpage


  def self.scrape_single_parent
    url = "https://wallethub.com/edu/best-cities-for-single-moms/19772/"
    doc = Nokogiri::HTML(open(url))

    best_places_for_single_parents = doc.search("div.cardhub-edu-table-div.sortable-main-1")  #one container of 20 items of data

    best_places_for_single_parents.each do |place|
      # instantiate an object and set its attributes
      best_place_for_single_parents = VillagetopiaCLI::Place.new

binding.pry
      best_place_for_single_parents.description_of_place = ""
      best_place_for_single_parents.rank = place.search.css.text

      # TODO: ?? how to write this variable to be equal to the key that has the word "single parent"
      best_place_for_single_parents.family_type = VillagetopiaCLI::User.family_structure[1]
      best_place_for_single_parents.city = place.search.css.text
      best_place_for_single_parents.state = place.search.css.text
      best_place_for_single_parents.city_webpage = ""
      end
  end
end

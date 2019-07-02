class VillagetopiaCLI::SingleParent
attr_accessor :name, :description, :rank, :family_type, :city, :state, :city_webpage


  def self.scrape_single_caretaker
    url = "https://havenlife.com/blog/best-cities-for-working-moms/"
    doc = Nokogiri::HTML(open(url))

    single_caretaker = doc.search("div.article-content")  #one container of 20 items of data

    single_caretaker.each do |best_place|
      best_place = VillagetopiaCLI::FindBestPlace.new

binding.pry

      single_caretaker.name = best_place.search("div.link-content h3").css("").text
      single_caretaker.description = 
      single_caretaker.rank = 
      single_caretaker.family_type = 
      single_caretaker.city = 
      single_caretaker.state = 
      single_caretaker.city_webpage = 

      end
  end

end

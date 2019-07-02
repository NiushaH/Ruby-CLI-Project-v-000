class VillagetopiaCLI::TwoParents
attr_accessor


  def self.scrape_two_caretakers
    url = "https://realestate.usnews.com/places/rankings/best-places-to-live"

    doc = Nokogiri::HTML(open(url))

  end

end

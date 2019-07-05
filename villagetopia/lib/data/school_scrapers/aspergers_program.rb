class VillagetopiaCLI::AspergersProgram
attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage


  def self.scrape_aspergers_schools

    url = "https://www.ourkids.net/aspergers-schools-usa.php"
    doc = Nokogiri::HTML(open(url))

    school_listing1 = doc.search('table.school_listing1')
    school_listing2 = doc.search('table.school_listing2')

    school_listings = [school_listing1, school_listing2]
    school_listings.each do |docs|
      schools = docs.css('div.grid-container')  #selecting one container (div id tags) that contains school info

        schools.each do |school|
          aspergers_school = VillagetopiaCLI::School.new
          names = doc.search("p.smaller-font").css("a").text

            names.each do |school|
              aspergers_school.name << school.text
            end

          aspergers_school.name = doc.search("p.smaller-font a").text
          aspergers_school.description = school.css('div.grid-x').text
          info_url = doc.search('div.grid-x')[3].css('div.cell.large-8.medium-8.small-12 a')[0]["href"]
          aspergers_school.more_info_url = "https://www.ourkids.net" + info_url
          aspergers_school.city = doc.search("div.grid-x").css("li")[0].text.gsub(",", "").split(" ").first.lstrip
          aspergers_school.state = doc.search("div.grid-x").css("li")[0].text.gsub(",", "").split(" ").last.gsub(/\(.*\)/, "")
          aspergers_school.type = doc.search("div.grid-x").css("li")[2].text.gsub(/\(.*\)/, "")

          # TODO: ?? how to write this variable to be equal to the key that has the word "Asperger's"
          aspergers_school.learning_profile = VillagetopiaCLI::School.types_of_learning[1]
          aspergers_school.grades = doc.search("div.grid-x").css("li")[1].text
        end
      end
  end



  def self.scrape_aspergers_details(aspergers_school)
    aspergers_school.more_info_url

    # doc_url = aspergers_school.more_info_url
    # doc_url = "https://www.ourkids.net/school/chamberlain-international-school-middleboro/632"
    doc_more = Nokogiri::HTML(open(doc_url))

    aspergers_school.webpage = doc_more.search("div.grid-x").css("a")[0]["href"]
    aspergers_school.email_address = doc_more.search("div.grid-x.align-middle").css("a.contact-btn")[0].text
    aspergers_school.phone_number = doc_more.search("div.grid-x.align-middle").css("a.contact-btn.phone-number")[0].text

# binding.pry
  end

end
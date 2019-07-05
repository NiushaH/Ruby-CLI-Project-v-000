class VillagetopiaCLI::TwiceExceptionalProgram
attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage


  def self.scrape_twice_exceptional_schools

    url = "https://educationaladvancement.org/resource/schools/?_sft_school-type=twice-exceptional"

    doc = Nokogiri::HTML(open(url))

    school_listing = doc.search('/html/body/div[2]/div/div/div/div[1]/div/div')  #one section of data
    schools = school_listing.css('article')  #selecting one container (articles id tags) that contains school info

      schools.each do |school|
        te_school = VillagetopiaCLI::School.new

        te_school.name = school.search('h2.search_link').text
        te_school.description = school.css('p').text
        te_school.more_info_url = school.css('a')[0].attribute('href').value
        te_school.city = "unknown"  #ideal scraped page would include city name
        te_school.state = school.css('span')[4].children[1].text
        te_school.type = school.css('span')[2].children.text if school.css('span')[2].children.text.include?("Online") end
        te_school.learning_profile = VillagetopiaCLI::School.types_of_learning[4]
        te_school.levels = school.css('span')[1].children.children.text
        te_school.grades = []
            te_school.levels.each do |el|
              te_school.grades << el.text
            end
        te_school.webpage = school.css('a')[1].attribute('href').value
      end
    end
#   end
# end

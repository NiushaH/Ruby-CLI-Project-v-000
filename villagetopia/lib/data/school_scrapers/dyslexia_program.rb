class VillagetopiaCLI::DyslexiaProgram
attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage


  def self.scrape_dyslexia_schools
    url = "https://www.ortonacademy.org/accreditation/dyslexia-in-schools/"
    doc = Nokogiri::HTML(open(url))

    school_listing = doc.search('div.fusion-text')

      school_listing.each do |school|
        dyslexia_school = VillagetopiaCLI::School.new

        dyslexia_school.name = school.search('div.fusion-text')[0].text.split("\n")[0]
        dyslexia_school.description = ""
        dyslexia_school.more_info_url = ""
        dyslexia_school.city = school.search('div.fusion-text')[0].text.split("\n")[3].gsub("(^\\w+)\\s.+", "").rpartition(",").first
        dyslexia_school.state = school.search('div.fusion-text')[0].text.split("\n")[3].gsub("(^\\w+)\\s.+", "").rpartition(",")[2].strip.rpartition(" ")[0]
        dyslexia_school.type = "Onsite", "Private"

        # TODO: ?? how to write this variable to be equal to the key that has the word "Dyslexia"
        dyslexia_school.learning_profile = VillagetopiaCLI::School.types_of_learning[2]
        dyslexia_school.levels = ""
        dyslexia_school.grades = []
        dyslexia_school.webpage = school.search('div.fusion-text').css('a').attribute('href').value
      end
  end
end

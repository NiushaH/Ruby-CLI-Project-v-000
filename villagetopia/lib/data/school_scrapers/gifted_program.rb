class VillagetopiaCLI::GiftedProgram
attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage


  def self.scrape_gifted_schools

    # only 25 schools listed per page
    pages = ["https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted",
    "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=2",
    "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=3",
    "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=4",
    "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=5"]

    pages.each do |url|
    doc = Nokogiri::HTML(open(url))

    school_listing = doc.search('/html/body/div[2]/div/div/div/div[1]/div/div')  #one section of data
    schools = school_listing.css('article')  #selecting one container (articles id tags) that contains school info

      schools.each do |school|
        gifted_school = VillagetopiaCLI::School.new

        gifted_school.name = school.search('h2.search_link').text
        gifted_school.description = school.css('p').text
        gifted_school.more_info_url = school.css('a')[0].attribute('href').value
        gifted_school.city = "unknown"  #ideal scraped page would include city name
        gifted_school.state = school.css('span')[3].children[1].text
        gifted_school.type = school.css('span')[2].children.text if school.css('span')[2].children.text.include?("Online")
        gifted_school.learning_profile = VillagetopiaCLI::School.types_of_learning[3]
        gifted_school.levels = school.css('span')[1].children.children
        gifted_school.grades = []
            gifted_school.levels.each do |el|
              gifted_school.grades << el.text
            end
        gifted_school.webpage = school.css('a')[1].attribute('href').value
      end
    end
  end

#   def self.scrape_gifted_details(gifted_school.more_info_url)
#     more_info_url = gifted_school.more_info_url
#     more_info_url = "https://educationaladvancement.org/grc/academy-for-advanced-and-creative-learning/"

#     gifted_contact_info = Nokogiri::HTML(open(more_info_url)).css('div.contact-details')
#         gifted_school.email_address = gifted_contact_info.children[4].text.gsub("Email: ", "")
#         gifted_school.phone_number = gifted_contact_info.children[2].text.gsub("Phone: ", "")
#   end

end
class GiftedSchoolsCLIProject::Scraper
attr_accessor :name, :description, :more_info_url, :location, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage


  def self.scrape_gifted_schools
    # only 25 schools listed per page
    pages = [
      "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted",
      "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=2",
      "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=3",
      "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=4",
      "https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted&sf_paged=5"
    ]

    pages.each do |url|
    doc = Nokogiri::HTML(open(url.to_s))

      school_listing = doc.search('/html/body/div[2]/div/div/div/div[1]/div/div')  #one section of data
      schools = school_listing.css('article')  #selecting one container (articles id tags) that contains school info

      schools.each do |school|
        gifted_school = GiftedSchoolsCLIProject::School.new

        gifted_school.learning_profile = "Gifted"
        gifted_school.city = "unknown"  #ideal scraped page would include city name, these pages are not displaying city data
        gifted_school.name = school.search('h2.search_link').text
        gifted_school.description = school.css('div p').text
        gifted_school.more_info_url = school.css('a')[0].attribute('href').value
        gifted_school.webpage = school.css('a')[1].attribute('href').value
        gifted_school.location = "Onsite" #why is this writing false instead of "Onsite"
        gifted_school.location = "Online" if gifted_school.location = school.css('div.entry-meta span').last.text.include?("Online")
        gifted_school.type = school.css('span')[2].children.text.gsub("School Types: ", "")

      #  TODO: Perfect STATE scrape with .scan(/[A-Z][a-z]+/) and #join method to include all states (including DC and states with two words)
        gifted_school.state = school.css('div.entry-meta span').last.text.gsub("Locations: ", "")
        gifted_school.grades = []
        school.css('span')[1].children.children.each do |el|
            gifted_school.grades << el.text
          end
      end
    end
  end

  def self.scrape_gifted_details(school_chosen_for_detailed_view)
    scraped_url = school_chosen_for_detailed_view.more_info_url

    more_contact_info = Nokogiri::HTML(open(scraped_url)).css('div.contact-details')

      school_chosen_for_detailed_view.email_address = more_contact_info.children[4].text.gsub("Email: ", "") if more_contact_info.children[4]
      school_chosen_for_detailed_view.phone_number = more_contact_info.children[2].text.gsub("Phone: ", "") if more_contact_info.children[2]
  end

end
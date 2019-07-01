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
    # FIX so that "Email address: " isn't part of string
        gifted_school.email_address = Nokogiri::HTML(open(gifted_school.more_info_url)).css('div.contact-details').children[4]
    # # FIX so that "Phone: " isn't part of string
        gifted_school.phone_number = Nokogiri::HTML(open(gifted_school.more_info_url)).css('div.contact-details').children[2].text
        gifted_school.city = "unknown"  #ideal scraped page would include city name
        gifted_school.state = school.css('span')[3].children[1].text
        gifted_school.type = school.css('span')[2].children.text if school.css('span')[2].children.text.include?("Online")
        gifted_school.learning_profile = "Gifted"
      # TO DO: separate the text scraped of each children element with a comma instead of to_sentence output
        gifted_school.levels = school.css('span')[1].children.children.text
      # .scan doesn't work on line 42
      #  HOW TO FIX so that takes only the string data as it's own element "K-5", "6-8" instead of "6-8K-5"???
        gifted_school.grades = []
    #     levels.each do |text|
    #       grades << text.scan("...")  # 
    #     end
        gifted_school.webpage = school.css('a')[1].attribute('href').value
      end
    end  
  end    
end
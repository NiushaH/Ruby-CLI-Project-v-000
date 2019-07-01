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
    # FIX so that "Email address: " isn't part of string
      te_school.email_address = Nokogiri::HTML(open(te_school.more_info_url)).css('div.contact-details').children[4]
    # # FIX so that "Phone: " isn't part of string
      te_school.phone_number = Nokogiri::HTML(open(te_school.more_info_url)).css('div.contact-details').children[2]
      te_school.city = "unknown"  #ideal scraped page would include city name
# FIX IT: For some reason it's looking for a #children method
# ERROR MSG: in `block in scrape_twice_exceptional_schools': undefined method 
#            `children' for nil:NilClass (NoMethodError)
      te_school.state = school.css('span')[4].children[1].text
      te_school.type = school.css('span')[2].children.text if school.css('span')[2].children.text.include?("Online")
      te_school.learning_profile = "Twice Exceptional"
      # TO DO: separate the text scraped of each children element with a comma instead of to_sentence output
      te_school.levels = school.css('span')[1].children.children.text
      # .scan doesn't work on line 42
      #  HOW TO FIX so that takes only the string data as it's own element "K-5", "6-8" instead of "6-8K-5"???
      te_school.grades = []
    #   levels.each do |text|
    #     grades << text.scan("...")  # 
    #   end
      te_school.webpage = school.css('a')[1].attribute('href').value
      end
  end    
end

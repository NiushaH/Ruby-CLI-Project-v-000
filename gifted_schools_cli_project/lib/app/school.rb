class GiftedSchoolsCLIProject::School
attr_accessor :name, :description, :more_info_url, :email_address, :location, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage

@@all = []
@@all_alphabetical_by_school_name = []
@@all_alphabetical_by_US_state = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.display_schools_question
    puts Rainbow("\nHow would you like to see a list of gifted schools?").green
    puts Rainbow("  1. By School Name").green
    puts Rainbow("  2. By US State\n").green
  end

  def self.ask_how_to_display_gifted_schools
    self.display_schools_question
    input = gets.strip.to_i
    view = ""
    
    if input.to_i == 1 || input.to_i == 2
      if input.to_i == 1
        view = "by_name"
        display_schools(view)
      elsif input.to_i == 2
        view = "by_state"
        display_schools(view)
      end      
    else
      self.display_schools_question
    end
  end

  def self.show_school_contact_info(school_chosen_for_detailed_view)
    puts Rainbow("\nWould you like contact information for this school? (y/n)").green
    want_contact_info = ""
    want_contact_info = gets.strip.downcase
    
    if want_contact_info == "y" || want_contact_info == "yes"
    GiftedSchoolsCLIProject::Scraper.scrape_gifted_details(school_chosen_for_detailed_view)
    puts Rainbow("\n- - - - - - - - - - - - - - - - - - - - - - - - - -").cyan
    puts Rainbow("#{school_chosen_for_detailed_view.name.upcase} CONTACT INFORMATION").magenta
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - - - - - - -\n").cyan

      if school_chosen_for_detailed_view.email_address.nil? == true
      else
        puts Rainbow("Email Address: ").cyan + Rainbow("#{school_chosen_for_detailed_view.email_address}").magenta
      end
      if school_chosen_for_detailed_view.phone_number.nil? == true
      else
        puts Rainbow("Phone Number: ").cyan + Rainbow("#{school_chosen_for_detailed_view.phone_number}").magenta
      end
      if school_chosen_for_detailed_view.webpage.nil? == true
      else
        puts Rainbow("Webpage: ").cyan + Rainbow("#{school_chosen_for_detailed_view.webpage}\n").magenta
      end
      
    else
      GiftedSchoolsCLIProject::User.continue_with_questions_or_exit
      self.ask_how_to_display_gifted_schools
    end
  end

  def self.school_details(school_chosen_for_detailed_view)
    if school_chosen_for_detailed_view.city != "unknown"
      puts Rainbow("City: ").cyan + Rainbow("#{school_chosen_for_detailed_view.city}").magenta
    end
    
    if school_chosen_for_detailed_view.type.include?("Online")
      puts Rainbow("Type:  ").cyan + Rainbow("Online").magenta
    else
      puts Rainbow("Type:  ").cyan + Rainbow("Onsite").magenta
    end

    puts Rainbow("Characteristics:  ").cyan + Rainbow("#{school_chosen_for_detailed_view.type}").magenta
    print_grades_nicely = school_chosen_for_detailed_view.grades.join(", ")
    puts Rainbow("Grades Served: ").cyan + Rainbow("#{print_grades_nicely}").magenta

    if school_chosen_for_detailed_view.description.nil? == false
      puts Rainbow("\nDescription of School:").cyan
      puts Rainbow("#{school_chosen_for_detailed_view.description}\n\n").magenta.scan(/(.{1,60})(?:\s|$)/m)
    end
  end

  # TODO: refactor #display_schools into cleaner code and multiple methods
  def self.display_schools(view)

    if view == "by_name"
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
      puts Rainbow("      GIFTED SCHOOLS SORTED BY NAME").green
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
    
      @@all_alphabetical_by_school_name = self.all.sort_by { |school| school.name }.uniq
      @@all_alphabetical_by_school_name.each_with_index do |school, index|
        puts Rainbow("#{index+1}.  #{school.name}  -  #{school.state}").cyan
        end

      puts Rainbow("\n\nWhich school would you like to view more details about?  Please enter the corresponding number of your choice.").green.scan(/(.{1,60})(?:\s|$)/m)
      school_index = gets.strip.to_i - 1
      school_chosen_for_detailed_view = @@all_alphabetical_by_school_name[school_index]

      puts Rainbow("\n- - - - - - - - - - - - - - - - - - - - -").cyan
      puts Rainbow("#{school_chosen_for_detailed_view.name.upcase}").magenta
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -\n").cyan   #prints 6 characters of whitespace
      puts Rainbow("State: ").cyan + Rainbow("#{school_chosen_for_detailed_view.state}").magenta
      school_details(school_chosen_for_detailed_view)
      show_school_contact_info(school_chosen_for_detailed_view)

    elsif view == "by_state"
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
      puts Rainbow("       STATES WITH GIFTED SCHOOLS").green
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan

      @@all_alphabetical_by_US_state = @@all.collect { |school| school.state }.uniq.sort
      # TODO: Add if expression to ignore any "and"s and to create duplicate object if location includes commas
      #   for schools located in multiple states (include DC; ignore Online as a state, it's a type; and include
      #   National in all states), or create a Class for states and look for location.include?(state_user_chose)
      #   to display data
      @@all_alphabetical_by_US_state.each.with_index do |state, index|
        puts Rainbow("#{index+1}.  #{state}").cyan
        
        end
      puts Rainbow("Which state's schools would you like to view?  Please enter the corresponding number of your choice.").green.scan(/(.{1,60})(?:\s|$)/m)
      
      state_user_chose = ""  # index value
      state_user_chose = gets.strip.to_i
      max_state_value = @@all_alphabetical_by_US_state.count
      state_index = state_user_chose - 1 if state_user_chose.between?(1, max_state_value)
      state_chosen_name = @@all_alphabetical_by_US_state[state_index]

      # TODO: Add if expression state_user_chose == nil 

      display_state_schools = @@all.select do |school| 
        school.state == state_chosen_name
        end
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
      puts Rainbow("#{state_chosen_name.upcase}'S GIFTED SCHOOLS").green
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
      display_state_schools.each_with_index do |school, index|
        puts Rainbow("#{index+1}.  #{school.name}").cyan  # add city string once data is known "  -  #{school.city}"
        end

      puts Rainbow("\n\nWhich school would you like to view more details about?  Please enter the corresponding number of your choice.").green.scan(/(.{1,60})(?:\s|$)/m)
      school_index = gets.strip.to_i
      school_chosen_for_detailed_view = display_state_schools[school_index-1]

      puts Rainbow("\n\nYou chose to see more about a school in #{school_chosen_for_detailed_view.state}").cyan
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
      puts Rainbow("#{school_chosen_for_detailed_view.name.upcase}").magenta
      puts Rainbow("- - - - - - - - - - - - - - - - - - - - -\n").cyan
      school_details(school_chosen_for_detailed_view)
      show_school_contact_info(school_chosen_for_detailed_view)

    else
      ask_how_to_display_gifted_schools
    end

    GiftedSchoolsCLIProject::User.continue_with_questions_or_exit
    self.ask_how_to_display_gifted_schools

  end

end

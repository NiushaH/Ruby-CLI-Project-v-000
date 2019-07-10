class GiftedSchoolsCLIProject::CLI

  def call
    greeting
    new_user = GiftedSchoolsCLIProject::User.new
    new_user.user_name
    new_user.learning_needs
    GiftedSchoolsCLIProject::Scraper.scrape_gifted_schools
    ask_how_to_display_gifted_schools
    goodbye
  end

  def greeting
    puts Rainbow("***************************************************************").cyan
    puts Rainbow("                 WELCOME TO GIFTED SCHOOL INFO").cyan
    puts Rainbow("***************************************************************").cyan
    puts Rainbow("We're so glad you're here.  We want to support you with information so you can find out about gifted schools across the United States!\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
  end

  def validate_input(input)  
    if input == "y" || input == "yes" || input == "n" || input == "no"
      continue_app(input)
    else
      continue_with_questions_or_exit
    end
  end

  def continue_app(input)
    if input.strip.downcase == "n" || input.strip.downcase == "no"
      puts Rainbow("\n\nThank you for trying out this resource.  We wish your child(ren) the best education possible!").cyan.scan(/(.{1,60})(?:\s|$)/m)
      puts Rainbow("\nIf you have any feedback to share, please contact Villagetopia.  Thank you!\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
      abort
    else
      puts Rainbow("\n\nOkay, let's take a look at a list of gifted schools in the US.\n").cyan
    end
  end

  def continue_with_questions_or_exit
    input = ""
    puts Rainbow("\n\nWould you like to continue and see a list of gifted schools? (y/n)").green
    input = gets.strip.downcase
    validate_input(input)
  end

  def display_schools_question
    puts Rainbow("\nHow would you like to see a list of gifted schools?").green
    puts Rainbow("  1. By School Name").green
    puts Rainbow("  2. By US State\n").green
  end

  def ask_how_to_display_gifted_schools
    input = ""
    display_schools_question
    input = gets.strip.to_i

      until input.to_i.between?(1, 2)
        display_schools_question
        input = gets.strip.to_i
          if input.to_i == 1
            view = "by_name"
            display_schools(view)
          elsif input.to_i == 2
            view = "by_state"
            display_schools(view)
          end
      end
  end

  def show_school_contact_info(school_chosen_for_detailed_view)
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
      
    end

    continue_with_questions_or_exit
    ask_how_to_display_gifted_schools
  end

  def school_details(school_chosen_for_detailed_view)
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

    if school_chosen_for_detailed_view.description.empty? == false
      puts Rainbow("\nDescription of School:").cyan
      puts Rainbow("#{school_chosen_for_detailed_view.description}\n\n").magenta.scan(/(.{1,60})(?:\s|$)/m)
    end
  end

  def display_schools(view)
    if view == "by_name"
      display_schools_by_name
    elsif view == "by_state"
      display_schools_by_US_state
    end
  end

  def list_schools_alphabetically_by_name
    @all_alphabetical_by_school_name = GiftedSchoolsCLIProject::School.all.sort_by { |school| school.name }.uniq
    @all_alphabetical_by_school_name.each_with_index do |school, index|
      puts Rainbow("#{index+1}.  #{school.name}  -  #{school.state}").cyan
      end
  end
  
  def list_schools_alphabetically_by_US_state
    @all_alphabetical_by_US_state = GiftedSchoolsCLIProject::School.all.collect { |school| school.state }.uniq.sort
    # TODO: Add if expression to ignore any "and"s and to create duplicate object if location includes commas
    #   for schools located in multiple states (include DC; ignore Online as a state, it's a type; and include
    #   National in all states), or create a Class for states and look for location.include?(state_user_chose)
    #   to display data
    @all_alphabetical_by_US_state.each.with_index do |state, index|
      puts Rainbow("#{index+1}.  #{state}").cyan
      end
  end

  def school_info(school_chosen_for_detailed_view)
    school_details(school_chosen_for_detailed_view)
    show_school_contact_info(school_chosen_for_detailed_view)

    continue_with_questions_or_exit
    ask_how_to_display_gifted_schools
  end

  def display_schools_by_name
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
    puts Rainbow("      GIFTED SCHOOLS SORTED BY NAME").green
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
    
    list_schools_alphabetically_by_name

    puts Rainbow("\n\nWhich school would you like to view more details about?  Please enter the corresponding number of your choice.").green.scan(/(.{1,60})(?:\s|$)/m)
    school_index = gets.strip.to_i - 1
    school_chosen_for_detailed_view = @all_alphabetical_by_school_name[school_index]

    puts Rainbow("\n- - - - - - - - - - - - - - - - - - - - -").cyan
    puts Rainbow("#{school_chosen_for_detailed_view.name.upcase}").magenta
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - -\n").cyan   #prints 6 characters of whitespace
    puts Rainbow("State: ").cyan + Rainbow("#{school_chosen_for_detailed_view.state}").magenta

    school_info(school_chosen_for_detailed_view)
  end

  # The #display_schools_by_US_state method could be made more concise
  def display_schools_by_US_state
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan
    puts Rainbow("       STATES WITH GIFTED SCHOOLS").green
    puts Rainbow("- - - - - - - - - - - - - - - - - - - - -").cyan

    list_schools_alphabetically_by_US_state

    puts Rainbow("Which state's schools would you like to view?  Please enter the corresponding number of your choice.").green.scan(/(.{1,60})(?:\s|$)/m)

    state_user_chose = ""  # index value
    state_user_chose = gets.strip.to_i
    max_state_value = @all_alphabetical_by_US_state.count
    state_index = state_user_chose - 1 if state_user_chose.between?(1, max_state_value)
    if state_index.to_i >= max_state_value.to_i
      continue_with_questions_or_exit
      ask_how_to_display_gifted_schools
    end

    # TODO: Add if expression for when state_user_chose == nil 
    # if state_user_chose.between?(1, max_state_value) == false
    #   ask_to_choose_state
    # end

    state_chosen_name = @all_alphabetical_by_US_state[state_index]
    display_state_schools = GiftedSchoolsCLIProject::School.all.select do |school| 
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
  
    school_info(school_chosen_for_detailed_view)
  end

  def goodbye
    puts Rainbow("\n\nWe hope you liked using this command line interface application and wish you all the best in finding the right second community for your child's educational endeavors.\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
    puts Rainbow("Please contact us at hello@solomomliving.com with any additional suggestions and/or comments.").cyan.scan(/(.{1,60})(?:\s|$)/m)
  end
end

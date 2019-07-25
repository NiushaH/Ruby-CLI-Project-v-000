=================
    NARRATIVE
=================
This Gifted Schools CLI Project is a stepping stone to a more complex application that I would like to build called Villagetopia.


==========================================
    LIST OF METHODS DEFINED IN CLASSES
==========================================
  GiftedSchoolsCLIProject::CLI
    :ask_how_to_display_gifted_schools,
    :ask_if_want_school_contact_info,
    :ask_user_which_state_schools_to_see,
    :assign_learning_needs,
    :assign_user_name,
    :confirm_user_profile,
    :continue_app,
    :continue_with_questions_or_exit,
    :display_schools,
    :display_schools_by_US_state,
    :display_schools_by_name,
    :display_schools_question,
    :greeting,
    :list_chosen_state_list_of_schools,
    :list_schools_alphabetically_by_US_state,
    :list_schools_alphabetically_by_name,
    :school_details,
    :school_info,
    :show_detailed_contact_info,
    :show_school_contact_info,
    :state_school_detailed_view,
    :validate_continue_input,
    :validate_display_schools_question,
    :validate_gifted_children_input,
    :validate_school_contact_question,
    :validate_state_school_input,
    :validate_users_state_choice

  GiftedSchoolsCLIProject::Scraper
    :scrape_gifted_schools,
    :scrape_gifted_details

  GiftedSchoolsCLIProject::School
    :city, 
    :description, 
    :email_address, 
    :grades, 
    :learning_profile, 
    :levels, 
    :more_info_url, 
    :name, 
    :phone_number, 
    :state, 
    :type, 
    :webpage


=========================
    PRE-CLI CHECKLIST
=========================
1. An overall summary of the application.
This application will help a user get the information they want without having to read through hundreds of schools listed in a directory.

2. What is your application going to do?
Show a list of schools and then offer the user specific contact information so they may reach out or learn more about the school.


============================================
    Responses to the best of my ability:
============================================
1. What website will you be scraping?
Gifted Schools: Institute for Educational Advancement https://educationaladvancement.org/resource/schools/?_sft_school-type=gifted

2. What will you need to do with the data you return from scraping?
I will need to create school objects with attributes.

3. What classes will you be using?
School
User

4. What will be the flow of displaying data for your application. ex How will your CLI portion work.
First, ask the user their name
Then, offer the user more info, should they wish to see a list of schools that specialize in teaching gifted children sorted alphabetically or by state.

5. How will you display data one level deep to the user?
Ask user to select a school for their contact information to reach out to the school.

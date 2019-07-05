#separation of concerns -- ask self where should code be

class VillagetopiaCLI::CLI
attr_accessor
attr_reader :user_name, :family_type, :children_learning_profile


  def call
    greeting
    new_user = VillagetopiaCLI::User.new
    new_user.user_name
    new_user.family_type
    # Tell Dustin problem was in my #confirm_family_profile method where the block had an invalid iteration.  Fixed it and it works now.  :)
    new_user.learning_needs

    # # TODO: Write a method to find_best_place = VillagetopiaCLI::FindBestPlace.new(new_user)

    # # TODO: *** WRITE A NOTE ABOUT WAITING FOR LOADING TIME??? ***
    # # TODO: Set SingleParent.scrape_single_parent method to save attributes of scraped data
    # # TODO: Ensure SingleParent.scrape_single_parent method saves place objects created from scraping
    VillagetopiaCLI::SingleParent.scrape_single_parent

    # # TODO: Write TwoParents.scrape_two_parents method to save attributes of scraped data
    # # TODO: Ensure TwoParents.scrape_two_parents method saves place objects created from scraping
    # VillagetopiaCLI::TwoParents.scrape_two_parents

    # # TODO: Ensure all school scrape methods save school objects created from scraping
    # VillagetopiaCLI::AspergersProgram.scrape_aspergers_schools
    # VillagetopiaCLI::AspergersProgram.scrape_aspergers_details(aspergers_school.more_info_url)
    # VillagetopiaCLI::DyslexiaProgram.scrape_dyslexia_schools
    # VillagetopiaCLI::GiftedProgram.scrape_gifted_schools
    # VillagetopiaCLI::TwiceExceptionalProgram.scrape_twice_exceptional_schools

    # # TODO: Write code to find user's best place based on new_user.confirm_family_profile
    # # TO DO: Write method to list user's best place, i.e. your_villagetopia
    # @your_villagetopia = VillagetopiaCLI::YourVillagetopia.villagetopia_results

    # # TODO: Want to know more about a best place location???
        # # if yes, what do you want to know about it?
        # # More about the place or the school(s)?
        # # Then use one-level deep method like VillagetopiaCLI::GiftedProgram.scrape_gifted_details(gifted_school) to get more

    # VillagetopiaCLI::CLI.goodbye
  end

  def greeting
    puts "***************************************************************"
    puts "                    WELCOME TO VILLAGETOPIA"
    puts "***************************************************************"
    puts "We're so glad you're here.  We want to support you with information so you can find your next best place to live!\n\n".scan(/(.{1,60})(?:\s|$)/m)
  end

  def self.goodbye
    puts "\n\nWe hope you liked Villagetopia.  Please contact Villagetopia with any additional suggestions and/or comments.".scan(/(.{1,60})(?:\s|$)/m)
  end

end

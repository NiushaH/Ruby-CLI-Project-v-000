#separation of concerns -- where should code be

class VillagetopiaCLI::CLI
attr_accessor :user_name


  def self.types_of_learning
    { 1 => "Asperger's",
      2 => "Dyslexia",
      3 => "Gifted",
      4 => "Twice Exceptional" }
  end

  def call
    greeting
    new_user = VillagetopiaCLI::User.new
    new_user.user_name
    new_user.family_type
    # need to fix IF LOOP on new_user.learning_needs method because its creating a nil
    new_user.learning_needs
    #run code to find user's best place based on new_user.confirm_family_profile
    new_user.confirm_family_profile
    # see list of your_villagetopia
    VillagetopiaCLI::CLI.goodbye
  end

  def greeting
    puts "We're so glad you're here.  We want to support you with information so you can find your next best place to live!\n\n".scan(/(.{1,60})(?:\s|$)/m)
  end

  def your_villagetopia
    @your_villagetopia = VillagetopiaCLI::YourVillagetopia.villagetopia_results

  end

  def self.goodbye
    puts "\n\nWe hope you liked Villagetopia.  Please contact Villagetopia with any additional suggestions and/or comments.".scan(/(.{1,60})(?:\s|$)/m)
  end

end


# VillagetopiaCLI::User.new("Mr. Rogers", 1, [1])

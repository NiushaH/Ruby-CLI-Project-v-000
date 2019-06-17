
class VillagetopiaCLI::CLI


FAMILY_PROFILE = {family_type: 1 || 2, children_learning_profile: "1of16variablespossiblecombos"}

  def call
    greeting
    user_initialize

    # your_villagetopia
    goodbye
  end

  def greeting
    puts "We're so glad you're here.  We want to support you with information so you can find your next best place to live!".scan(/(.{1,60})(?:\s|$)/m)
  end

  def user_initialize(family_type = "1".to_i)
    @family_type = VillagetopiaCLI::FamilyType.menu_family_type
    #save family_type and children_learning_profile data to FAMILY_PROFILE
    @children_learning_profile = children_learning_profile


  end



  def school_program_types
    puts "What types of school program support(s) do your children need?
    \n
    If more than one type is needed, please type a comma between each corresponding number.  For example, if Asperger's, Dyslexia, and Twice Exceptional are needed, please enter 1, 2, 4 as your response.".scan(/(.{1,60})(?:\s|$)/m)
    puts <<-DOC.gsub /^\s*/, ''
      1. Asperger's
      2. Dyslexia
      3. Gifted
      4. Twice Exceptional
    DOC
  end

#   def menu_school_program_types
#     puts "Enter the types of school programs that would support your children's
#     learning and development."
#     while input != "exit"
#       input = gets.strip.downcase

#   end

  def your_villagetopia
    @your_villagetopia = VillagetopiaCLI::YourVillagetopia.for_user_profile

  end

  def goodbye
    puts "Please contact Villagetopia with any additional suggestions and/or comments."
  end

end


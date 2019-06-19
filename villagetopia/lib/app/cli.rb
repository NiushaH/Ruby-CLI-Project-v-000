
class VillagetopiaCLI::CLI
attr_accessor :user_name


  def call
    greeting
    create_user
    VillagetopiaCLI::FamilyType.menu_family_type
    binding.pry
    VillagetopiaCLI::ChildrenLearningProfile.menu_children_learning_profile
    # confirm user's family profile
    # run program to find best place matches
    # see list of your_villagetopia
    goodbye
  end

  def greeting
    puts "We're so glad you're here.  We want to support you with information so you can find your next best place to live!
    ".scan(/(.{1,60})(?:\s|$)/m)
  end

  def create_user
    user_name(input = "")
    VillagetopiaCLI::User.new(@user_name, @family_type, @children_learning_profile)
  end

  def user_name(input)
    @user_name = input
    puts "Let's get better acquainted!  What's your name?"
    input = gets.chomp
    puts ""
    puts ""
    puts ""
    puts "It's nice to meet you #{input}!  We are the team at Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)
    puts ""
    puts ""
    puts "We have a couple of questions for you and then we can wow you with data to help you narrow down the possibilities about where in the USA to live your best family life!".scan(/(.{1,60})(?:\s|$)/m)
    @user_name << input
  end


  def school_program_types
    puts "What types of school program support(s) do your children need?"
    puts ""
    puts "If more than one type is needed, please type a comma between each corresponding number.  For example, if Asperger's, Dyslexia, and Twice Exceptional are needed, please enter 1, 2, 4 as your response.".scan(/(.{1,60})(?:\s|$)/m)
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
    puts "We hope you liked Villagetopia.  Please contact Villagetopia with any additional suggestions and/or comments."
  end

end


# VillagetopiaCLI::User.new("Mr. Rogers", 1, [1])

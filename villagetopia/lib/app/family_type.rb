class VillagetopiaCLI::FamilyType
attr_accessor :name

  @@family_type = []

  def self.name
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Single Parent
    #   2. Two Parents
    # DOC

    family_type_1 = self.new
    family_type_1.name = "One Caretaker or Single Parent Family"

    family_type_2 = self.new
    family_type_2.name = "Two Caretakers or Dual Parent Family"

    [family_type_1, family_type_2]
  end

#   def self.count
#     @@family_type.map{ |e| e}.count
#   end

  def self.family_type_list
    puts " "
    puts "What type of household best describes your family?"
    @family_type = self.name
    @family_type.each.with_index(1) do |family_type, i|
    puts "#{i}. #{family_type.name}"
    end
    puts " "
    puts "Please enter the number of caretakers in your family.
    "
  end

  def self.menu_family_type
    family_type_list

    input = nil
    while input.to_s != "exit"
    input = gets.strip.downcase

      if input.to_i == 1
      puts "Thank you for letting us know you are a single parent household."
      save(input = 1)
      @children_learning_profile = VillagetopiaCLI::ChildrenLearningProfile.menu_children_learning_profile

      elsif input.to_i == 2
      puts "Thank you for letting us know you are a dual parent household."
      save(input = 2)
      @children_learning_profile = VillagetopiaCLI::ChildrenLearningProfile.menu_children_learning_profile

      elsif input.to_i >= 3
        puts "Not sure what you want, please type list, help, or exit."
        puts "The following are the only 2 family structure options in Villagetopia."
        family_type_list

      elsif input.to_s == "help"  || input.to_s == "list"
        puts "For Villagetopia results to be the most relevant, please help us understand your household makeup."
        family_type_list
      else

      end
    end

    goodbye
  end

  def self.save(input)
    @@family_type << input
  end

end

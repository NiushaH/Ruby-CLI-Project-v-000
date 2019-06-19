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
    puts "So, what type of household best describes your family?"
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

    input = ""
    until input.to_i == 1 || input.to_i == 2
    input = gets.strip.downcase

      if input.to_i == 1
      puts "Thank you for letting us know you are a single parent household."
      save(input = 1)

      elsif input.to_i == 2
      puts "Thank you for letting us know you are a dual parent household."
      save(input = 2)

      elsif input.to_i >= 3 || input == "0"
        puts ""
        puts ""
        puts "Hmmmm... not sure which option to choose?\n"
        family_type_list

      elsif input.to_s == "help"  || input.to_s == "list" || input != "1" || input != "2"
        puts ""
        puts ""
        puts "For Villagetopia results to be the most relevant, please help us understand your household makeup.".scan(/(.{1,60})(?:\s|$)/m)
        family_type_list
      else

      end
    end
  end

  def self.save(input)
    @@family_type << input.to_i
  end

end

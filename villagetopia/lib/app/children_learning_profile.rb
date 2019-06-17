class VillagetopiaCLI::ChildrenLearningProfile
attr_accessor :children_learning_profile_combo, :name

  @@types_of_learning_needs = []
  @@children_learning_profile = []

  def self.types_of_learning_needs
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Asperger's
    #   2. Dyslexia
    #   3. Gifted
    #   4. Twice Exceptional
    # DOC

    types_of_learning_needs_1 = self.new
    types_of_learning_needs_1.name = "Asperger's"

    types_of_learning_needs_2 = self.new
    types_of_learning_needs_2.name = "Dyslexia"

    types_of_learning_needs_3 = self.new
    types_of_learning_needs_3.name = "Gifted"

    types_of_learning_needs_4 = self.new
    types_of_learning_needs_4.name = "Twice Exceptional"

    [types_of_learning_needs_1, types_of_learning_needs_2, types_of_learning_needs_3, types_of_learning_needs_4]

    # save_types_of_learning_needs(name)
  end

#   def save_types_of_learning_needs(name)
#     @@types_of_learning_needs << self
#   end

#   def self.count
#     @@types_of_learning_needs.map{ |e| e}.count
#   end

  def self.children_learning_profile_list
    puts " "
    puts "Villagetopia knows how important the right support is when raising your children.  Are any of the following learning differences apparent in your child(ren)?".scan(/(.{1,60})(?:\s|$)/m)
    @types_of_learning_needs = self.types_of_learning_needs
    @types_of_learning_needs.each.with_index(1) do |types_of_learning_needs, i|
    puts "#{i}. #{types_of_learning_needs.name}"
    end
    puts "#{types_of_learning_needs.count + 1}. None of the above."
    puts " "
    puts "Please enter the corresponding number(s) above of the types of learning difference(s) which would best serve your child(ren)'s educational needs.
    ".scan(/(.{1,60})(?:\s|$)/m)
  end

  def self.menu_children_learning_profile
    children_learning_profile_list

    input = nil
    while input.to_s != "exit" || input.to_s != "help" || input.to_s != "list"
    input = gets.strip.downcase

    get_all_familys_childrens_learning_profile

        if input.to_i >= self.count
            puts "Not sure what you want, please type list, help, or exit."
            puts "Currently, the following are the only #{self.count} educational program support options in Villagetopia."
            menu_children_learning_profile

        elsif input.to_s == "help"  || input.to_s == "list"
            puts "For Villagetopia results to be the most relevant, please help us understand your children's educational needs."
            menu_children_learning_profile
        else
        end
    end
  end

  def get_all_familys_childrens_learning_profile(input)
    input = nil

    while input.to_s != "exit"
    input = gets.strip.downcase

        if input.to_i == 1 || input.to_i == 2 || input.to_i == 3 || input.to_i == 4
        save_children_needs(input.to_i)
        puts "Are there any other learning support programs that would benefit your child(ren)'s education?  If not, please enter #{types_of_learning_needs.count + 1}."
        children_learning_profile_list
          if input.to_i == 5
          puts "We will look for places which have #{family_type} and #{children_learning_profile}."
          elsif input.to_i == 1 || input.to_i == 2 || input.to_i == 3 || input.to_i == 4
          save_children_needs(input.to_i)
          puts "Are there any other learning differences apparent in your child(ren)?  If not, please enter 5."
          children_learning_profile_list
            if input.to_i == 5
            puts "We will look for places which have #{family_type} and #{children_learning_profile}."
            elsif input.to_i == 1 || input.to_i == 2 || input.to_i == 3 || input.to_i == 4
            save_children_needs(input.to_i)
            puts "Are there any other learning differences apparent in your child(ren)?  If not, please enter 5."
            children_learning_profile_list
              if input.to_i == 5
              puts "We will look for places which have #{family_type} and #{children_learning_profile}."
              elsif input.to_i == 1 || input.to_i == 2 || input.to_i == 3 || input.to_i == 4
              save_children_needs(input.to_i)
              else
              end
            end
          end
        end
    end
  end

  def goodbye
    puts "Please contact us with any additional suggestions and/or comments."
  end

  def self.save_children_needs(input)
    @@children_learning_profile << input
  end

end

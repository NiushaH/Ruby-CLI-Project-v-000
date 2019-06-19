class VillagetopiaCLI::ChildrenLearningProfile
attr_accessor :children_learning_profile, :name

  @@types_of_learning_needs = []
  @@user_input_of_learning_differences = []
  @@children_learning_profile = []

  def self.types_of_learning_needs
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Asperger's
    #   2. Dyslexia
    #   3. Gifted
    #   4. Twice Exceptional
    # DOC

    types_of_learning_needs[0] = self.new
    types_of_learning_needs[0].name = "Asperger's"

    types_of_learning_needs[1] = self.new
    types_of_learning_needs[1].name = "Dyslexia"

    types_of_learning_needs[2] = self.new
    types_of_learning_needs[2].name = "Gifted"

    types_of_learning_needs[3] = self.new
    types_of_learning_needs[3].name = "Twice Exceptional"

    types_of_learning_needs = [types_of_learning_needs_1, types_of_learning_needs[1], types_of_learning_needs[2], types_of_learning_needs[3]]

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
    while input.to_s != "exit" || input.to_s != "help" || input.to_s != "list"  || input != "next" || input.to_i != 5 || input.to_i != 0
    input = gets.strip.downcase

    # self.get_all_familys_childrens_learning_profile

        if input.to_i < 5 || input.to_i > 0
          @@user_input_of_learning_differences << input.to_i if !@@user_input_of_learning_differences.include?(input.to_i)
            puts "We have stored the #{corresponding types_of_learning_needs.name with the index number input} learning difference in your family profile.  Are there any other learning support programs that would benefit your child(ren)'s education?  If not, please type 'next'.".scan(/(.{1,60})(?:\s|$)/m)
            puts "Are there any other learning support programs that would benefit your child(ren)'s education?  If not, please type 'next'."

        elsif input.to_i >= self.count
            puts "Not sure what you want, please type list, help, or exit."
            puts "Currently, the following are the only #{self.count} educational program support options in Villagetopia."
            menu_children_learning_profile

        elsif input.to_s == "next" || input.to_s == "Next"
            puts "Based upon your entries, we have noted that your children could use support with the following learning areas:"
            @user_input_of_learning_differences.each do |types_of_learning_needs|
    puts "* #{types_of_learning_needs.name}"
    end

        elsif input.to_s == "help" || input.to_s == "list"
            puts "For Villagetopia results to be the most relevant, please help us understand your children's educational needs."
            menu_children_learning_profile
        else
        end
        binding.pry
    end
  end

  def goodbye
    puts "Please contact us with any additional suggestions and/or comments."
  end

  def assign_children_learning_profiles
    sorted_array_of_learning_differences = @@user_input_of_learning_differences.sort.uniq

      if sorted_array_of_learning_differences == [1]
        @@children_learning_profile << types_of_learning_needs[0]
      elsif sorted_array_of_learning_differences == [1,2]
        @@children_learning_profile << types_of_learning_needs[0] && types_of_learning_needs[1]
      elsif sorted_array_of_learning_differences == [1,3]
        @@children_learning_profile << types_of_learning_needs[0] && types_of_learning_needs[2]
      elsif sorted_array_of_learning_differences == [1,4]
        @@children_learning_profile << types_of_learning_needs[0] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [2]
        @@children_learning_profile << types_of_learning_needs[1]
      elsif sorted_array_of_learning_differences == [2,3]
        @@children_learning_profile << types_of_learning_needs[1] && types_of_learning_needs[2]
      elsif sorted_array_of_learning_differences == [2,4]
        @@children_learning_profile << types_of_learning_needs[1] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [3]
        @@children_learning_profile << types_of_learning_needs[2]
      elsif sorted_array_of_learning_differences == [3,4]
        @@children_learning_profile << types_of_learning_needs[2] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [4]
        @@children_learning_profile << types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [1,2,3]
        @@children_learning_profile << types_of_learning_needs_1 && types_of_learning_needs[1] && types_of_learning_needs[2]
      elsif sorted_array_of_learning_differences == [2,3,4]
        @@children_learning_profile << types_of_learning_needs[1] && types_of_learning_needs[2] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [1,3,4]
        @@children_learning_profile << types_of_learning_needs_1 && types_of_learning_needs[2] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [1,2,4]
        @@children_learning_profile << types_of_learning_needs_1 && types_of_learning_needs[1] && types_of_learning_needs[3]
      elsif sorted_array_of_learning_differences == [1,2,3,4]
        @@children_learning_profile << types_of_learning_needs_1 && types_of_learning_needs[1] && types_of_learning_needs[2] && types_of_learning_needs[3]
      else input == nil
        puts "There is insufficient family profile input to compile Villagetopia list."
      end
  end


end

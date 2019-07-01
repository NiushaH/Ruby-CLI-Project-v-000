class VillagetopiaCLI::User
attr_accessor :name, :family_type, :children_learning_profile, :children_learning_profile_values


  def family_structure
    { 1 => "One Caretaker or Single Parent Family",
      2 => "Two Caretakers or Dual Parent Family"}
  end

  def user_name
    puts "Let's get better acquainted!  What's your name?"
    input = gets.strip
    @name = input
    puts "\n\nIt's nice to meet you #{input}!  We are the team at Villagetopia.\n\n".scan(/(.{1,60})(?:\s|$)/m)
    puts "We have a couple of questions for you and then we can wow you with data to help you narrow down the possibilities about where in the USA to live your best family life.".scan(/(.{1,60})(?:\s|$)/m)
    puts "So, let's get started."
  end

  def family_type_question
    puts "\nWhat type of household best describes your family?"
      family_structure.each { |key, family_structure| puts "#{key}. #{family_structure}"}
  end

  def save_family_type(input)
    family_type_hash_pointer = input.to_i - 1
    @family_type = family_structure.values[family_type_hash_pointer]

    if input.to_i == 1
    puts "\nThank you for letting us know you are a single parent household.\n\n"
    elsif  input.to_i == 2
    puts "\nThank you for letting us know you are a dual parent household.\n\n"
    end
  end

  def family_type
    input = ""

      until input.to_i == 1 || input.to_i == 2
        family_type_question
        puts "\nPlease enter the corresponding number (above) for the best description of your family.\n".scan(/(.{1,60})(?:\s|$)/m)
        input = gets.strip.downcase

          if input == "help"
          puts "\nPlease enter a '1' or a '2' to let us know the number of caretakers in your family.  For more help, please contact Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)

          elsif input == "list"
          puts "\nThe family structures Villagetopia has are:"
          family_structure.each { |key, family_structure| puts "* #{family_structure}"}

          elsif input.to_i >= 3
          puts "\n\nHmmmm... not sure which option to choose?\n"
          puts "\nFor Villagetopia results to be the most relevant, please help us understand your household makeup.".scan(/(.{1,60})(?:\s|$)/m)

          elsif input == "exit"
          VillagetopiaCLI::CLI.goodbye
          end
        save_family_type(input)
      end
  end

  def children_learning_needs_question
    puts "\nPlease share with us your child(ren)'s learning needs.  Currently Villagetopia has data about schools which support the following learning needs:\n\n".scan(/(.{1,60})(?:\s|$)/m)
    VillagetopiaCLI::CLI.types_of_learning.each { |key, learning_needs| puts "#{key}. #{learning_needs}"}
    puts "** Type 'done' if all your child(ren)'s learning needs have been entered."
    puts "** Type 'none' if your child(ren) do not have any of the above learning needs."
    puts "\nPlease enter the corresponding number(s) from the above list for your child(ren)'s learning needs.  If there is more than one learning need, you will be given the option to add another.  Otherwise, please type 'done'.\n\n".scan(/(.{1,60})(?:\s|$)/m)
  end

  def pass_learning_needs_keys_values_to_profile(input_ln)
#  Because Asperger's is capitalized, there is an if expression in this method
    if input_ln.to_i == 1
      type_of_learning_hash_key = input_ln.to_i - 1
      @children_learning_profile.push(type_of_learning_hash_key)
      @children_learning_profile_values.push(VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key])
      @children_learning_profile.sort.uniq
      @children_learning_profile_values.sort.uniq
      puts "\nYour family profile now includes #{VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key]} learning needs.".scan(/(.{1,60})(?:\s|$)/m)

    elsif input_ln.to_i == 2 || input_ln.to_i == 3 || input_ln.to_i == 4
    type_of_learning_hash_key = input_ln.to_i - 1
      @children_learning_profile.push(type_of_learning_hash_key)
      @children_learning_profile_values.push(VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key])
      @children_learning_profile.sort.uniq
      @children_learning_profile_values.sort.uniq
      puts "\nYour family profile now includes #{VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key].downcase} learning needs.".scan(/(.{1,60})(?:\s|$)/m)
    end
  end

  def learning_needs
    input_ln = ""
    @children_learning_profile = []
    @children_learning_profile_values = []

        until @children_learning_profile == [0, 1, 2, 3] || input_ln == "done" || input_ln == "none" || input_ln == "exit" do
          children_learning_needs_question
          input_ln = gets.strip.downcase

            if input_ln.to_i == 1 || input_ln.to_i == 2 || input_ln.to_i == 3 || input_ln.to_i == 4
            pass_learning_needs_keys_values_to_profile(input_ln)

            elsif input_ln == "help" || input_ln == "'help'"
            puts "Currently the options are to enter a number or type 'done' or 'none'.  Otherwise, please feel free to contact Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)

            elsif input_ln == "list" || input_ln == "'list'"
            puts "Please enter a corresponding number that best describes your child(ren)'s learning need(s) or type 'done' or 'none'.".scan(/(.{1,60})(?:\s|$)/m)
            end
        confirm_family_profile
        end

        if input_ln == "exit"
          VillagetopiaCLI::CLI.goodbye
        end

  end


  def confirm_family_profile
    puts "\n\nThank you for sharing information to create your family profile."
    puts "  You are a #{@family_type}."
    if @children_learning_profile == nil
      puts "  And, no child(ren)-related learning needs have been identified."
    elsif @children_learning_profile.any?(Integer)
      puts "  And, your family profile includes the following learning needs:"
      @children_learning_profile_values.sort.each_with_index { |v, i| puts "    * #{v}"}
    end
    # SOMEDAY: Add option here to change profile info??
  end

end

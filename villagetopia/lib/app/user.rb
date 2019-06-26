class VillagetopiaCLI::User
attr_accessor :name, :family_type, :learning_needs_keys_user_input, :learning_needs_names_user_input, :children_learning_profile, :children_learning_profile_values


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

  def save_children_learning_profile(input_ln)
    if input_ln == "done"
    elsif input_ln.to_i == 1 || input_ln.to_i == 2 || input_ln.to_i == 3 || input_ln.to_i == 4
      type_of_learning_hash_key = input_ln.to_i - 1
      @learning_needs_keys_user_input.push(type_of_learning_hash_key)
      @learning_needs_names_user_input.push(VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key])
      puts "\nYour family profile now includes #{VillagetopiaCLI::CLI.types_of_learning.values[type_of_learning_hash_key]}."
    end
  end

  def learning_needs
    input_ln = ""
    @learning_needs_keys_user_input = []
    @learning_needs_names_user_input = []

    until input_ln == "done" || input_ln == "'done'"
      children_learning_needs_question
      input_ln = gets.strip.downcase
        # if input_ln == "help" || input_ln == "'help'"
        #     puts "Currently the options are to enter a number or type 'done' or 'none'.  Otherwise, please feel free to contact Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)
        # elsif input_ln == "list" || input_ln == "'list'"
        #     puts "Please enter a corresponding number that best describes your child(ren)'s learning need(s) or type 'done' or 'none'.".scan(/(.{1,60})(?:\s|$)/m)
        # elsif input_ln == "none" || input_ln == "'none'"
        #     puts "\n\nThank you for sharing information to create your family profile."
        #     puts "You are a #{@family_type} looking for your best place to raise a family."
        # elsif input_ln == "exit"
        #     VillagetopiaCLI::CLI.goodbye
        # elsif input_ln.to_i != Integer || input_ln != "help" || input_ln != "list" || input_ln != "none" || input_ln != "'help'" || input_ln != "'list'" || input_ln != "'none'"
        #     puts "Please enter a corresponding number to your child(ren)'s learning need or type 'done', 'none', 'list'.'"
        # else
        # end
      save_children_learning_profile(input_ln)
    end
# why does UNTIL lose all the info that was saved with #saved_children_learning_profile??? and become nil
  end

  def confirm_family_profile
    @children_learning_profile = @learning_needs_keys_user_input.sort.uniq - [0]
    @children_learning_profile_values = @learning_needs_names_user_input.sort.uniq
    puts "\n\nThank you for sharing information to create your family profile."
    puts "You are a #{@family_type} with the following learning needs:"
    @children_learning_profile_values.each { |learning_need| puts "  * #{learning_needs}"}
   # SOMEDAY: Add option here to change profile info??
    puts "\n\nNow, Villagetopia will look through it's data to suggest places in the USA that offer resources and a community that could be your family's ideal Villagetopia.".scan(/(.{1,60})(?:\s|$)/m)

  end

end

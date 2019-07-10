class GiftedSchoolsCLIProject::User
attr_accessor :user_name, :gifted_children
      

  def user_name
    input = ""
    puts Rainbow("Let's get better acquainted!  What's your name?").green
    input = gets.strip.downcase.gsub(/\b('?[a-z])/) { $1.capitalize }
    @user_name = input
    if input.strip.empty? == true
      puts Rainbow("\n\nIt's nice to meet you!  We are the team at Villagetopia.\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
    else
      puts Rainbow("\n\nIt's nice to meet you #{@user_name}!  We are the team at Villagetopia.\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
    end
    puts Rainbow("Our gifted schools information tool can help you find US schools that specialize in working with gifted students.\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
    puts Rainbow("\nSo, let's get started.").cyan
  end

  #instance method
  def validate_input(input)  
    if input == "y" || input == "yes" || input == "n" || input == "no"
      continue_app(input)
    else
      continue_with_questions_or_exit
    end
  end

  # instance method
  def continue_app(input)
    if input.strip.downcase == "n" || input.strip.downcase == "no"
      puts Rainbow("\n\nThank you for trying out this resource.  We wish your child(ren) the best education possible!").cyan.scan(/(.{1,60})(?:\s|$)/m)
      puts Rainbow("\nIf you have any feedback to share, please contact Villagetopia.  Thank you!\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
      abort    
    else
      puts Rainbow("\n\nOkay, let's take a look at a list of gifted schools in the US.\n").cyan
    end
  end

  # instance method
  def continue_with_questions_or_exit
    input = ""
    puts Rainbow("\n\nWould you like to continue and see a list of gifted schools? (y/n)").green
    input = gets.strip.downcase
    validate_input(input)
  end

  def confirm_user_profile
    puts Rainbow("\n\nGreat!  Thanks for sharing the details to create your user profile.").cyan
    if @user_name.strip.empty? == true
      puts Rainbow("Your name has not been shared and you have #{@gifted_children.to_i} kid(s) with gifted learning needs.").cyan.scan(/(.{1,60})(?:\s|$)/m)
    else 
      puts Rainbow("Your name is #{@user_name} and you have #{@gifted_children.to_i} kid(s) with gifted learning needs.").cyan.scan(/(.{1,60})(?:\s|$)/m)
    end
  end

  def learning_needs
    input_ln = ""
    @gifted_children = Integer
        
    puts Rainbow("\nHow many of your children have gifted learning needs?\n\n").green.scan(/(.{1,60})(?:\s|$)/m)
    input_ln = gets.strip.downcase
    @gifted_children = input_ln.to_i

      if input_ln.to_i == 0 || input_ln == ""
        continue_with_questions_or_exit
          
      elsif input_ln.to_i >= 1
        confirm_user_profile
        puts Rainbow("\n\nLet's continue.\n").cyan
      end    
    end



# PUT THESE 3 METHODS IN TWICE (once with self so it can be accessed/called from School class)
# Receive NameError when method is class method, and receive NoMethodError when it's an instance method
# Instance Method Missing Error:
# gifted_schools_cli_project/lib/app/user.rb:65:in `learning_needs': undefined local variable or method `continue_with_questions_or_exit' for #<GiftedSchoolsCLIProject::User:0x0000000003c71958> (NameError)
# Class Method Missing Error"
# gifted_schools_cli_project/lib/app/school.rb:65:in `show_school_contact_info': undefined method `continue_with_questions_or_exit' for GiftedSchoolsCLIProject::User:Class (NoMethodError)
  def self.validate_input(input)  
    if input == "y" || input == "yes" || input == "n" || input == "no"
      continue_app(input)
    else
      continue_with_questions_or_exit
    end
  end

  def self.continue_app(input)
    if input.strip.downcase == "n" || input.strip.downcase == "no"
      puts Rainbow("\n\nThank you for trying out this resource.  We wish your child(ren) the best education possible!").cyan.scan(/(.{1,60})(?:\s|$)/m)
      puts Rainbow("\nIf you have any feedback to share, please contact Villagetopia.  Thank you!\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
      abort
    else
      puts Rainbow("\n\nOkay, let's take a look at a list of gifted schools in the US.\n").cyan
    end
  end

  def self.continue_with_questions_or_exit
    input = ""
    puts Rainbow("\n\nWould you like to continue and see a list of gifted schools? (y/n)").green
    input = gets.strip.downcase
    validate_input(input)
  end

end

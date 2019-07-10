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
        GiftedSchoolsCLIProject::CLI.continue_with_questions_or_exit
          
      elsif input_ln.to_i >= 1
        confirm_user_profile
        puts Rainbow("\n\nLet's continue.\n").cyan
      end    
    end
 
end

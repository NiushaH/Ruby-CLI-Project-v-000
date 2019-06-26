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

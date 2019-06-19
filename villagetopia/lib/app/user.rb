class VillagetopiaCLI::User
attr_accessor :name, :family_type, :children_learning_profile


  def initialize(name = @user_name, family_type = @family_type, children_learning_profile = @children_learning_profile)
    @name = name
    @family_type = family_type
    # VillagetopiaCLI::FamilyType.menu_family_type
    #save family_type and children_learning_profile data to FAMILY_PROFILE
    @children_learning_profile = children_learning_profile
  end
end

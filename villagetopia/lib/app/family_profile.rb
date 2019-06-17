class VillagetopiaCLI::Family_Profile
  attr_reader


  def family_profile(family_type, children_learning_profile)

    #single parent with learning profile A
      if @@family_type.contains(1) && children_learning_profile == "aspergers_program"

    #single parent with learning profile AD
    #   @@family_type.contains(1) && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "gifted_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "twice_exceptional_program"

    #single parent with learning profile A
      elsif family_type == "single parent" && school_program_types == "dyslexic_program"
    #   family_type == "single parent" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program"
    #   family_type == "single parent" && school_program_types == "dyslexic_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "gifted_program"
    #   family_type == "single parent" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program"
    #   family_type == "single parent" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "single parent" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"

    #two parents with learning profile A
      elsif family_type == "two parents" && school_program_types == "aspergers_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "gifted_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "twice_exceptional_program"

    #two parents with learning profile D
      elsif family_type == "two parents" && school_program_types == "dyslexic_program"
    #   family_type == "two parents" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program"
    #   family_type == "two parents" && school_program_types == "dyslexic_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "gifted_program"
    #   family_type == "two parents" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program"
    #   family_type == "two parents" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "twice_exceptional_program"
    #   family_type == "two parents" && school_program_types == "aspergers_program" && school_program_types == "dyslexic_program" && school_program_types == "gifted_program" && school_program_types == "twice_exceptional_program"
    else
      "There is insufficient family profile input to compile Villagetopia list."
    end

  end


end
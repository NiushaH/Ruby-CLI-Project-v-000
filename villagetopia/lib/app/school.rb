class VillagetopiaCLI::Schools
attr_accessor :name, :city, :state, :profile, :learning_profile, :access_method, :grades_served

  def self.profile
    # a list of the types of schools with programs for various learning profiles
    # puts a list of those with scraped data

    puts <<-DOC.gsub /^\s*/, ''
      1. Make Your Best Life, US state
      2. 2nd Best Place to Plant Roots, US state
    DOC

    school_1 = self.new
    school_1.name = "We Do Our Best School"
    school_1.city = "Some Place"
    school_1.state = "Some US State"
    school_1.learning_profile = "Asperger's"
    school_1.access_method = "brick and mortar"
    school_1.grades_served = ["PreK", "K-5", "6-8", "9-12"]

    school_2 = self.new
    school_2.name = "We Do Our Best School"
    school_2.city = "Some Place"
    school_2.state = "Some US State"
    school_2.learning_profile = "Dyslexic"
    school_2.access_method = "Online"
    school_2.grades_served = ["PreK", "K-5", "6-8", "9-12"]

    school_3 = self.new
    school_3.name = "We Do Our Best School"
    school_3.city = "Some Place"
    school_3.state = "Some US State"
    school_3.learning_profile = "Gifted"
    school_3.access_method = "Online"
    school_3.grades_served = ["PreK", "K-5", "6-8", "9-12"]

    school_4 = self.new
    school_4.name = "We Do Our Best School"
    school_4.city = "Some Place"
    school_4.state = "Some US State"
    school_4.learning_profile = "Twice Exceptional"
    school_4.access_method = "online"
    school_4.grades_served = ["PreK", "K-5", "6-8", "9-12"]

  end

  def self.access_method
    puts <<-DOC.gsub /^\s*/, ''
      1. Brick and mortar
      2. Online
    DOC

    school_access_method_1 = self.new
    school_access_method_1.name = "Brick and mortar"

    school_access_method_2 = self.new
    school_access_method_2.name = "Online"
  end


  def self.grades_served
    puts <<-DOC.gsub /^\s*/, ''
      1. PreK
      2. K-5
      3. 6-8
      4. 9-12
    DOC

    grades_served_1 = self.new
    grades_served_1.grade = "PreK"

    grades_served_2 = self.new
    grades_served_2.grade = "K-5"

    grades_served_3 = self.new
    grades_served_3.grade = "6-8"

    grades_served_4 = self.new
    grades_served_4.grade = "9-12"

  end

end

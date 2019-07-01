class VillagetopiaCLI::School
attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage

@@all = []

  def initialize
    @@all << self
  end
  
  def self.all
   @@all
  end

  def self.type
    { 1 => "Onsite",
      2 => "Online"}
  end

  def self.grades
    { 1 => "PreK",
      2 => "K-5",
      3 => "6-8",
      4 => "9-12"}
  end

end

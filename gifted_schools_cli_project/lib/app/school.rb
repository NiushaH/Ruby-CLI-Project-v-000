class GiftedSchoolsCLIProject::School
attr_accessor :name, :description, :more_info_url, :email_address, :location, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage

@@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end

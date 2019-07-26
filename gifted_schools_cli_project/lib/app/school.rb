class GiftedSchoolsCLIProject::School
attr_accessor :name, :description, :more_info_url, :email_address, :location, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage

@@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(string)
    self.all.select { |s| s.name.include?(string)}

    # results = []
    # @@all.map do |s|
    #   if s.name.include?(string)
    #   end
    # end.compact
  end

end

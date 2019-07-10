class GiftedSchoolsCLIProject::CLI

  def call
    greeting
    new_user = GiftedSchoolsCLIProject::User.new
    new_user.user_name
    new_user.learning_needs
    # fake_data_set = GiftedSchoolsCLIProject::DataFromScraper.new
    # GiftedSchoolsCLIProject::DataFromScraper.fake_data
    GiftedSchoolsCLIProject::Scraper.scrape_gifted_schools
    GiftedSchoolsCLIProject::School.ask_how_to_display_gifted_schools
    goodbye
  end

  def greeting
    puts Rainbow("***************************************************************").cyan
    puts Rainbow("                 WELCOME TO GIFTED SCHOOL INFO").cyan
    puts Rainbow("***************************************************************").cyan
    puts Rainbow("We're so glad you're here.  We want to support you with information so you can find out about gifted schools across the United States!\n\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
  end

  def goodbye
    puts Rainbow("\n\nWe hope you liked using this command line interface application and wish you all the best in finding the right second community for your child's educational endeavors.\n").cyan.scan(/(.{1,60})(?:\s|$)/m)
    puts Rainbow("Please contact us at hello@solomomliving.com with any additional suggestions and/or comments.").cyan.scan(/(.{1,60})(?:\s|$)/m)
  end
end

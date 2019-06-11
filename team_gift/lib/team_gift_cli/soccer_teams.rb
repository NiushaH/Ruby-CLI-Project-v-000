class TeamGiftCLI::SoccerTeams
attr_accessor :tournament_name, :team_name, :roster, :positions

  def self.all
    #Scrape World Cup Website and then return team name, roster of players, players positions
    self.scrape_WorldCupTeams
  end

  def self.scrape_WorldCupTeams
    Mens_Soccer_2018_World_Cup_Teams = []

    Mens_Soccer_2018_World_Cup_Teams << self.scrape_WCPage

  # Go to WC Teams Page, find the teams page
  # Extract the confederation name, country name, roster, and positions
  # Instantiate a team associated with the Men's Soccer 2018 World Cup Tournament Name

    Mens_Soccer_2018_World_Cup_Teams
  end

 def self.scrape_WCPage
   doc = Nokogiri::HTML(open("https://www.fifa.com/worldcup/teams/"))

   binding.pry
#  Go to Avi's scrape along video at https://www.youtube.com/watch?v=_lDExWIhYKI for how to pry to find right property info on page

   soccer_teams_1.tournament_name = doc.search("h1.fi-section-header__competition__title").text
   soccer_teams_1.data-team_number = doc.search('a.data-team').first.attr("data-confed")
   soccer_teams_1.team_name = doc.search("div.fi-team-card__name").text
   soccer_teams_1.data-team_number = doc.search('a.data-team').first.attr("data-team")
   soccer_teams_1.roster_page_url = doc.search('a.data-team').first.attr("a.href")
#  <a class="fi-team-card fi-team-card__team" data-team="43935" data-confed="UEFA" href="/worldcup/teams/team/43935/">

   soccer_teams_1
 end

end
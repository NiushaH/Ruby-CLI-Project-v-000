class TeamGiftCLI::SoccerTournaments
attr_accessor :name, :teams, :url

  @@all = []

  def initialize(name)
    @tournament = name

  end

  def self.all
    #should return list of soccer tournaments
    puts <<-DOC.gsub /^\s*/, ''
      1. Men's World Cup Soccer 2018
    DOC

    soccer_tournament_1 = self.new
    soccer_tournament_1.name = "Men's World Cup Soccer 2018"
    soccer_tournament_1.teams = "list of country teams"
    soccer_tournament_1.url = "url"

    [tournament_1]
  end
end


world_cup = SoccerTournament.new
world_cup.name = "Men's World Cup Soccer 2018"
world_cup.teams =
world_cup.url = "https://www.fifa.com/worldcup/teams/"

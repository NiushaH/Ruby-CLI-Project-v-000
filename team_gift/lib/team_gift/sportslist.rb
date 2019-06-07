class TeamGift::SportsList
attr_accessor :name, :tournaments, :teams, :roster

#   @@all = []

  def self.all
    #should return list of sports with custom gifts available

    sport_1 = self.new
    sport_1.name = "Basketball"
    sport_1.tournaments = "Women's NCAA Basketball Tournament 2019"
    sport_1.teams = "list of teams"
    sport_1.roster = "list of players on teams"

    sport_2 = self.new
    sport_2.name = "Soccer"
    sport_2.tournaments = "Men's World Cup Soccer 2018"
    sport_2.teams = "list of teams"
    sport_2.roster = "list of players on teams"

    [sport_1, sport_2]
  end

end

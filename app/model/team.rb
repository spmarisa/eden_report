class Team
  attr_accessor :name, :players

  def initialize(team_name, team_players)
    @name = team_name
    @players = team_players
  end
end

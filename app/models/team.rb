require 'securerandom'

class Team
  attr_accessor :id, :name, :players

  def initialize(team_name, team_players)
    @id = SecureRandom.uuid
    @name = team_name
    @players = team_players
  end
end

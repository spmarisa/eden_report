require 'securerandom'

class Player
  attr_accessor :id, :name, :team_id

  def initialize(player_name, team_id)
    @id = rand(3000.3999)
    @name = player_name
    @team_id = team_id
  end
end

require 'securerandom'

class Player
  attr_accessor :id, :name, :team_id, :batting_order

  def initialize(player_name, team_id, batting_order)
    @id = rand(4000..4999)
    @name = player_name
    @team_id = team_id
    @batting_order = batting_order
  end
end

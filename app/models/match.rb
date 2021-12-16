require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs, :number_of_players, :team1, :team2, :team1_order, :team2_order,
                :bowls, :state, :outcome, :winner

  def initialize(number_of_overs, number_of_players)
    @id = SecureRandom.uuid
    @state = "STARTING"
    @number_of_overs = number_of_overs
    @number_of_players = number_of_players
  end
end

require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs, :number_of_players,
                :current_batsman, :current_bowler, :current_over, :current_over_bowl_number,
                :bowls, :state, :outcome, :winner

  def initialize(number_of_overs, number_of_players)
    @id = SecureRandom.uuid
    @state = "STARTING"
    @number_of_overs = number_of_overs
    @number_of_players = number_of_players
  end
end

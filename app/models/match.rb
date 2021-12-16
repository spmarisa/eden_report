require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs_per_team, :number_of_players_per_team,
                :current_batsman, :current_bowler, :current_over, :current_over_bowl_number, :current_team, :current_playing_batsmen,
                :bowls, :state, :outcome, :winner

  def initialize(number_of_overs_per_team, number_of_players_per_team)
    @id = SecureRandom.uuid
    @state = "STARTING"
    @number_of_overs_per_team = number_of_overs_per_team
    @number_of_players_per_team = number_of_players_per_team
  end
end

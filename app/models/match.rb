require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs_per_team, :number_of_players_per_team,
                :current_team_name, :striking_batsman_name, :non_striking_batsman_name, :current_bowler_name, :current_over, :current_over_bowl_number,
                :state, :outcome, :winner

  def initialize(number_of_overs_per_team, number_of_players_per_team)
    @id = rand(2000.2999)
    @state = "STARTING"
    @number_of_overs_per_team = number_of_overs_per_team
    @number_of_players_per_team = number_of_players_per_team
  end
end

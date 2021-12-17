require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs_per_team, :number_of_players_per_team,
                :batting_team_id, :striking_batsman_id, :non_striking_batsman_id,
                :bowling_team_id, :bowler_id, :over_number, :bowl_number,
                :state, :outcome, :winning_team_id

  def initialize(number_of_overs_per_team, number_of_players_per_team)
    @id = rand(2000..2999)
    @state = "RUNNING"
    @number_of_overs_per_team = number_of_overs_per_team
    @number_of_players_per_team = number_of_players_per_team
  end

  def is_completed()
    # @state == 'COMPLETED'
    #TODO
    true
  end
end

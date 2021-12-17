require 'securerandom'

class Match
  attr_accessor :id, :number_of_overs_per_team, :number_of_players_per_team,
                :batting_team_id, :striking_batsman_id, :non_striking_batsman_id,
                :bowling_team_id, :bowler_id, :over_number, :bowl_number,
                :state, :outcome, :winning_team_id

  # state => "TEAM_1_BATTING", "TEAM_2_BATTING", "OVER"
  # outcome => "WIN", "DRAW"

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

  def is_over_completed()
    @bowl_number == 6
  end

  def is_current_team_batting_over()
    return true if (@over_number == @number_of_overs_per_team && @bowl_number == 6)

    score_card = TeamScoreCard.get_team_score_by_team_id(@batting_team_id)
    return true if score_card.wickets_remaining == 1
    return true if (@state == "TEAM_2_BATTING" && (score_card.total_score > score_card.runs_needed_to_win))
  end
end

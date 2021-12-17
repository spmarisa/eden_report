require 'securerandom'

class TeamScoreCard
  attr_accessor :id, :team_id, :match_id, :total_score, :wickets_remaining, :runs_needed_to_win

  def initialize(team_id, match_id, number_of_players)
    @id = rand(3000..3999)
    @team_id = team_id
    @match_id = match_id
    @wickets_remaining = number_of_players
    @total_score = @runs_needed_to_win = 0
  end
end

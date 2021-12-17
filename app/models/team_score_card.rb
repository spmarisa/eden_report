require 'securerandom'

class TeamScoreCard
  attr_accessor :id, :team_id, :match_id, :total_score, :wickets,
                :remaining_players, :runs_needed_to_win

  def initialize(team_id, match_id)
    @id = SecureRandom.uuid
    @team_id = team_id
    @match_id = match_id
    @total_score = @wickets = 0
  end
end

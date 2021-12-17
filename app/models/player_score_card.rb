require 'securerandom'

class PlayerScoreCard
  attr_accessor :id, :player_id, :match_id,
                :runs_scored, :bowls_faced, :extra_bowls_faced, :fours_scored, :sixes_scored, :batting_status,
                :runs_conceded, :bowls_thrown, :extra_bowls_thrown, :fours_conceded, :sixes_conceded, :wickets_taken

  def initialize(player_id, match_id)
    @id = rand(5000..5999)
    @player_id = player_id
    @match_id = match_id
    @batting_status = 'NOT_PLAYED'
    @runs_scored = @bowls_faced = @extra_bowls_faced = @fours = @sixes = 0
    @runs_conceded = @bowls_thrown = @extra_bowls_thrown = @fours = @sixes = @wickets_taken = 0
  end
end

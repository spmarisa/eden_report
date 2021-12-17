require 'securerandom'

class PlayerScoreCard
  attr_accessor :id, :player_id, :match_id,
                :runs_scored, :bowls_faced, :extra_bowls_faced, :fours, :sixes, :batting_status,
                :runs_conceded, :bowls_thrown, :extra_bowls_thrown, :fours, :sixes

  def initialize(player_id, match_id)
    @id = rand(4000.4999)
    @player_id = player_id
    @match_id = match_id
    @batting_status = 'NOT_PLAYED'
    @runs_scored = @bowls_faced = @extra_bowls_faced = @fours = @sixes = 0
    @runs_conceded = @bowls_thrown = @extra_bowls_thrown = @fours = @sixes = 0
  end
end

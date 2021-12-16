class PlayerScore
  attr_accessor :id, :player, :match,
                :total_score, :bowls_faced, :extra_bowls, :fours, :sixes

  def initialize(player, match)
    @id = SecureRandom.uuid
    @player = player
    @match = match
    @total_score = @bowls_faced = @extra_bowls = @fours = @sixes = 0
  end
end

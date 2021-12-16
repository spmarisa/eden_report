require 'securerandom'

class PlayerScore
  attr_accessor :id, :player, :match,
                :total_score, :bowls_faced, :extra_bowls, :fours, :sixes, :status

  def initialize(player, match)
    @id = SecureRandom.uuid
    @player = player
    @match = match
    @status = 'PLAYING'
    @total_score = @bowls_faced = @extra_bowls = @fours = @sixes = 0
  end
end

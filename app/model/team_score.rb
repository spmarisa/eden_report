require 'securerandom'

class TeamScore
  attr_accessor :id, :team, :match, :total_score, :wickets

  def initialize(team, match)
    @id = SecureRandom.uuid
    @team = team
    @match = match
    @total_score = @wickets = 0
  end
end

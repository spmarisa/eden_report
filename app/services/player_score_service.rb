require_relative '../repos/in_memory_repo'
require_relative '../models/PlayerScore'


module PlayerScoreService

  def self.update_score(bowl)
    player_score = get_player_score_by_name(bowl.batsman.name) || PlayerScore.new(bowl.batsman, bowl.match)
    player_score.total_score += bowl.score
    player_score.bowls_faced += 1

    if bowl.state == 'WIDE' || bowl.state == 'NO_BALL'
      player_score.extra_bowls += 1
    end

    player_score.score += 4 if bowl.score == 4
    player_score.score += 6 if bowl.score == 6

    player_score.status = 'OUT' if bowl.state == 'OUT'
  end

  def self.get_player_score_by_name(name)
    InMemoryRepo.get_all_player_scores.find { |score| score.player.name == name }
  end
end

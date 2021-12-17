require_relative '../repos/in_memory_repo'
require_relative '../models/PlayerScore'


module PlayerScoreCardService

  def self.process_event(bowl)
    batsman = PlayerService.get_player_by_id(bowl.batsman_id)
    batsman_score_card = get_score_card_by_player_id(batsman.id)
    batsman_score_card.runs_scored += bowl.score
    batsman_score_card.bowls_faced += 1
    batsman_score_card.extra_bowls_faced += 1 if bowl.is_extra_bowl()
    batsman_score_card.fours_scored += 1 if bowl.is_four()
    batsman_score_card.sixes_scored += 1 if bowl.is_six()
    batsman_score_card.batting_status = (bowl.is_out() ? "OUT" : "PLAYING")

    bowler = PlayerService.get_player_by_id(bowl.bowler_id)
    bowler_score_card = get_score_card_by_player_id(bowler.id)
    bowler_score_card.runs_conceded += bowl.score
    bowler_score_card.bowls_thrown += 1
    bowler_score_card.extra_bowls_thrown += 1 if bowl.is_extra_bowl()
    bowler_score_card.fours_conceded += 1 if bowl.is_four()
    bowler_score_card.sixes_conceded += 1 if bowl.is_six()
    batsman_score_card.wickets_taken += 1 if bowl.is_out()
  end

  def self.get_all_score_cards()
    PlayerScoreCardRepo.get_all_cards()
  end

  def self.get_score_card_by_player_id(player_id)
    get_all_score_cards.find { |score_card| score_card.player_id == player_id }
  end

end

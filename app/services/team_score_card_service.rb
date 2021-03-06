require_relative '../models/team_score_card'
require_relative '../repos/team_score_card_repo'
require_relative '../services/team_service'
require_relative '../services/match_service'


module TeamScoreCardService

  def self.initialize_team_score_cards()
    teams = TeamService.get_all_teams()
    match = MatchService.get_match()
    score_cards = teams.map { |team| TeamScoreCard.new(team.id, match.id, match.number_of_players_per_team) }

    TeamScorecardRepo.save_score_cards(score_cards)
  end

  def self.process_event(bowl)
    team_score_card = get_team_score_by_team_id(bowl.team_id)
    team_score_card.total_score += bowl.score
    team_score_card.wickets_remaining -= 1 if bowl.is_out()
  end

  def self.get_team_score_by_team_id(team_id)
    get_all_score_card().find { |score_card| score_card.team_id == team_id }
  end

  def self.are_both_team_scores_same()
    get_all_score_cards().first.score == get_all_score_cards().last.score
  end

  def self.team_id_with_highest_score()
    first_team_score_card = get_all_score_cards().first
    second_team_score_card = get_all_score_cards().last

    if first_team_score_card.score > second_team_score_card.score()
      return first_team_score_card.team_id
    else
      return second_team_score_card.team_id
    end
  end


  def self.get_all_score_cards()
    TeamScorecardRepo.get_score_cards()
  end
end

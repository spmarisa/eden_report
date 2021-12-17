require_relative '../repos/team_score_card_repo'
require_relative '../models/team_score_card'
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

  def self.get_all_score_cards()
    TeamScorecardRepo.get_score_cards()
  end
end

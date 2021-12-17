require_relative '../repos/in_memory_repo'
require_relative '../models/TeamScore'


module TeamScoreCardService

  def self.initialize_team_score_cards()
    teams = TeamService.get_all_teams()
    match = MatchService.get_match()
    score_cards = teams.map { |team| TeamScoreCard.new(team.id, match.id) }

    TeamScorecardRepo.save_score_cards(score_cards)
  end

  # def self.create_score_board(team_name)
  #   match = MatchService.get_match()
  #   team = TeamService.get_team_by_name(team_name)
  #   team_score = TeamScore.new(team, match)
  #
  #   InMemoryRepo.save_team_score(team_score)
  # end
  #
  # def self.update_score(bowl)
  #   team_score = get_team_score_by_name(bowl.match.current_team.name) || TeamScore.new(bowl.match, bowl.match.current_team)
  #   team_score.total_score += bowl.score
  #
  #   team_score.score += 4 if bowl.score == 4
  #   team_score.score += 6 if bowl.score == 6
  #
  #   team_score.status = 'OUT' if bowl.state == 'OUT'
  # end
  #
  # def self.get_team_score_by_name(name)
  #   InMemoryRepo.get_all_team_scores.find { |score| score.team.name == name }
  # end
end

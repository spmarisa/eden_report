require_relative '../repos/team_repo'
# require_relative '../services/match_service'
# require_relative '../models/player'
require_relative '../models/team'

module TeamService

  def self.create_teams(list_of_team_names)
    teams = list_of_team_names.map { |team_name| Team.new(team_name) }
    TeamRepo.save_teams(teams)
  end

  def self.get_all_teams()
    TeamRepo.get_teams()
  end

  # def self.create_team_with_players(team_name, player_names)
  #   match = MatchService.get_match()
  #   players = player_names.map { |player_name| Player.new(player_name) }
  #   team = Team.new(team_name, players)
  #
  #   player_score_cards =  players.map { |player| PlayerScore.new(player, match) }
  #
  #   InMemoryRepo.save_team(team)
  # end
  #
  # def self.get_team_by_name(team_name)
  #   InMemoryRepo.get_teams().find { |team| team.name == team_name }
  # end
end

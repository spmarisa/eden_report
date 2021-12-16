require_relative '../repos/in_memory_repo'
require_relative '../models/player'
require_relative '../models/team'

module TeamService

  def self.create_team_with_players(team_name, player_names)
    players = player_names.map { |player_name| Player.new(player_name) }
    team = Team.new(team_name, players)

    InMemoryRepo.save_team(team)
  end

  def self.get_team_by_name(team_name)
    InMemoryRepo.get_teams().find { |team| team.name == team_name }
  end
end

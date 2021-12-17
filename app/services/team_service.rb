require_relative '../repos/team_repo'
require_relative '../models/team'

module TeamService

  def self.create_teams(list_of_team_names)
    teams = list_of_team_names.each_with_index.map { |team_name, order| Team.new(team_name, order+1) }
    TeamRepo.save_teams(teams)
  end

  def self.get_all_teams()
    TeamRepo.get_teams()
  end

  def self.get_team_by_order(order_number)
    get_all_teams().find { |team| team.batting_order == order_number }
  end
end

require_relative '../services/match_service'
require_relative '../services/team_service'
require_relative '../utils/input_adapter'

module TeamController

  def self.get_team_names_and_process()
    team_names_in_order_of_batting = InputHandler.get_input_as_array("Please enter team names in order of batting, separated by ','")
    TeamService.create_teams(team_names_in_order_of_batting)
  end

end

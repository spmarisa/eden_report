require_relative '../services/team_service'
require_relative '../services/player_service'
require_relative '../utils/input_adapter'

module PlayerController

  def self.get_and_process_player_details()
    teams = TeamService.get_all_teams()

    teams.each do |team|
      player_names = InputHandler.get_input_as_array("Please enter players of #{team.name} separated by ','")
      PlayerService.create_players_and_score_cards(team.id, player_names)
    end
  end

end

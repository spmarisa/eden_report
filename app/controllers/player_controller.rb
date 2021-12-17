require_relative '../services/match_service'
require_relative '../services/team_service'
require_relative '../utils/input_adapter'

module MatchController

  def self.get_and_process_player_details()
    team = TeamService.get_all_teams()

    teams.each do |team|
      player_names = InputAdapter.get_input_as_array("Please enter player of #{team.name} separated by ','")
      PlayerService.create_players_and_score_cards(team.id, player_names)
    end
  end

end

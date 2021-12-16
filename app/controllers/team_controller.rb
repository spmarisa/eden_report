require_relative '../services/match_service'
require_relative '../services/team_service'
require_relative '../utils/input_adapter'

module TeamController

  def self.register_team(team_name)
    number_of_players = MatchService.get_match().number_of_players
    player_names = InputAdapter.get_seq_input_as_array("Please enter player names one after another", number_of_players)
    TeamService.create_team_with_players(team_name, player_names)
  end

end

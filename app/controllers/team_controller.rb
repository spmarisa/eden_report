require_relative '../services/match_service'
require_relative '../services/team_service'
require_relative '../services/team_score_service'
require_relative '../utils/input_adapter'

module TeamController

  def self.get_and_process_team_details(team_name)
    number_of_players = MatchService.get_match().number_of_players_per_team
    player_names = InputAdapter.get_seq_input_as_array("Please enter player names one after another", number_of_players)

    TeamService.create_team_with_players(team_name, player_names)
    TeamScoreService.create_score_board(team_name)
  end

end

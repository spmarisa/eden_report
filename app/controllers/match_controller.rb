require_relative '../services/match_service'
require_relative '../services/team_service'
require_relative '../utils/input_adapter'

module MatchController

  def self.get_and_process_match_details()
    number_of_players = InputAdapter.get_integer_input("Please enter No. of players for each team:")
    number_of_overs = InputAdapter.get_integer_input("Please enter No. of overs for each team:")

    MatchService.initialize_match(number_of_overs, number_of_players)
  end

  # def self.update_match_details_wrt_team(team_name)
  #   team = TeamService.get_team_by_name(team_name)
  #   match = MatchService.get_match()
  #
  #   match.current_batsman = team.players[0]
  #   match.current_over = 1
  #   match.current_over_bowl_number = 1
  #   match.current_playing_batsmen = [team.players[0], team.players[1]]
  # end

end

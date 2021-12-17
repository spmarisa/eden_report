require_relative '../services/match_service'
require_relative '../utils/input_adapter'

module MatchController

  def self.get_and_process_match_details()
    number_of_players = InputHandler.get_integer_input("Please enter No. of players for each team:")
    number_of_overs = InputHandler.get_integer_input("Please enter No. of overs for each team:")

    MatchService.initialize_match(number_of_overs, number_of_players)
  end

end

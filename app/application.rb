require_relative 'controllers/match_controller'
require_relative 'controllers/team_controller'
require_relative 'utils/constants'
require_relative 'repos/in_memory_repo'

include Constants

module Application

  def self.start()
    MatchController.get_and_process_match_details()

    TeamController.register_team("TEAM1")
    ScoreController.process_input_bowls()

    TeamController.register_team("TEAM2")
    ScoreController.process_input_bowls()

    InMemoryRepo.all()

    # display_result()
  end

  Application.start()
end

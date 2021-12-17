require_relative 'controllers/match_controller'
require_relative 'controllers/team_controller'
require_relative 'controllers/score_controller'
require_relative 'utils/constants'
require_relative 'repos/in_memory_repo'

include Constants

module Application

  def self.start()
    TeamService.create_teams(["TEAM1", "TEAM2"])

    MatchController.get_and_process_match_details()

    TeamScoreCardService.initialize_team_score_cards()

    PlayerController.get_and_process_player_details()

    # TeamController.get_and_process_team_details("TEAM1")
    # MatchController.update_match_details_wrt_team("TEAM1")
    # ScoreController.get_and_process_input_bowls()
    #
    # TeamController.get_and_register_team("TEAM2")
    # MatchController.update_initial_match_details("TEAM2")
    # ScoreController.get_and_process_input_bowls()
    #
    # InMemoryRepo.all()

    # display_result()
  end

  Application.start()
end

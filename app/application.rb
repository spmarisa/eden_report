require_relative 'controllers/match_controller'
require_relative 'controllers/team_controller'
require_relative 'controllers/player_controller'
require_relative 'controllers/bowl_controller'
require_relative 'services/team_service'
require_relative 'services/team_score_card_service'

#TODO - remove later
# require_relative 'repos/team_repo'
# require_relative 'repos/match_repo'

module Application

  def self.start()

    TeamController.get_team_names_and_process()

    MatchController.get_and_process_match_details()

    TeamScoreCardService.initialize_team_score_cards()

    PlayerController.get_and_process_player_details()

    MatchService.populate_initial_team_details()

    BowlController.start_consuming_bowls()

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

    #TODO - remove later
    puts ""
    puts TeamRepo.get_teams().inspect
    puts ""
    puts MatchRepo.get_match().inspect
    puts ""
    puts TeamScorecardRepo.get_score_cards().inspect
    puts ""
    puts PlayerRepo.get_all_players().inspect
    puts ""
    puts PlayerScoreCardRepo.get_all_cards().inspect
    puts ""
    puts BowlRepo.get_all_bowls().inspect
  end

  Application.start()
end

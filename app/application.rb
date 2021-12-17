require_relative 'controllers/bowl_controller'
require_relative 'controllers/match_controller'
require_relative 'controllers/player_controller'
require_relative 'controllers/team_controller'
require_relative 'services/team_score_card_service'
require_relative 'services/match_service'

module Application

  def self.start()
    TeamController.get_team_names_and_process()

    MatchController.get_and_process_match_details()

    TeamScoreCardService.initialize_team_score_cards()

    PlayerController.get_and_process_player_details()

    MatchService.populate_initial_team_details()

    BowlController.start_consuming_bowls()
  end

  Application.start()
end

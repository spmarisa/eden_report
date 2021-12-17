require_relative '../services/bowl_service'
require_relative '../services/match_service'
require_relative '../utils/input_adapter'

module BowlController

  def self.start_consuming_bowls()
    #TODO - regex validation
    bowl_input_regex = nil
    match_running = true

    while(match_running)
      bowl_user_input = InputAdapter.get_input_in_given_format(bowl_input_regex)


      # valuidate bowler name
      bowl = BowlService.process_bowl_raw_input(bowl_user_input)
      PlayerScoreCardService.process_event(bowl)
      TeamScoreService.process_event(bowl)
      MatchService.process_event(bowl)


      match = MatchService.get_match()
      match_running = false if match.is_completed
    end
  end

end

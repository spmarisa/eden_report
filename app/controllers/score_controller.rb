require_relative '../services/bowl_service'
require_relative '../services/match_service'
require_relative '../services/player_score_service'
require_relative '../services/team_score_service'

module ScoreController

  def self.get_and_process_input_bowls()
    number_of_overs = MatchService.get_number_of_overs()

    number_of_overs.times do
      take_inputs_of_single_over
    end
  end

  private
  def self.take_inputs_of_single_over()
    valid_bowls = 0
    while(valid_bowls != 6)
      raw_input = gets.chomp

      bowl = BowlService.process_bowl_input(raw_input)
      PlayerScoreService.update_score(bowl)
      TeamScoreService.update_score(bowl)
      MatchService.update_match_details(bowl)


      valid_bowls += 1 if bowl.is_valid()
    end
  end

end

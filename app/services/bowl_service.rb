require_relative '../repos/in_memory_repo'
require_relative '../models/match'
require_relative '../models/bowl'


module BowlService
  BowlStruct = Struct.new(:batsman, :bowler, :match, :over_number, :order_number, :outcome_type, :score)

  def self.process_bowl_input(raw_input)
    match = MatchService.get_match
    state, score = Bowl.process_bowl_raw_input(raw_input)

    bowl_args = BowlStruct.new(match.current_batsman, match.current_bowler, match, match.current_over,
                               match.current_over_bowl_number, state, score)
    bowl = Bowl.new(bowl_args)
    InMemoryRepo.save_bowl(bowl)
    return bowl
  end
end

require_relative '../repos/bowl_repo'
require_relative '../models/match'
require_relative '../models/bowl'


module BowlService

  def self.process_bowl_raw_input(raw_input)
    match = MatchService.get_match()

    bowler_name, raw_score_info = raw_input.split(" ")
    bowl_type, score = process_raw_score_info(raw_score_info)
    current_bowler = PlayerService.get_player_of_team_by_name(match.bowling_team_id, bowler_name)


    bowl = Bowl.new()
    bowl.batsman_id = match.striking_batsman_id
    bowl.bowler_id = current_bowler.id
    bowl.match_id = match.id
    bowl.over_number = match.over_number
    bowl.bowl_number = match.bowl_number
    bowl.type = bowl_type
    bowl.score = score

    BowlRepo.save_bowl(bowl)
    return bowl
  end


  def self.process_raw_score_info(raw_input)
    case
    when raw_input == 'WIDE'
      return 'WIDE', 1
    when raw_input == 'NO_BALL'
      return 'NO_BALL', 1
    when raw_input == 'OUT'
      return 'OUT', 0
    else
      return 'HIT', Integer(raw_input)
    end
  end
end

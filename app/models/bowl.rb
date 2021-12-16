require 'securerandom'

class Bowl
  attr_accessor :id, :batsman, :bowler,
                :match, :over_number, :order_number, :outcome_type, :score

  # outcome_type - score, wide, noball, out, runout

  def initialize(bowl_args)
    @id = SecureRandom.uuid
    @batsman = bowl_args.batsman
    @bowler = bowl_args.bowler
    @match = bowl_args.match
    @over_number = bowl_args.over_number
    @order_number = bowl_args.order_number
    @outcome_type = bowl_args.outcome_type
    @score = bowl_args.score
  end

  def is_valid()
    return !(@outcome_type == 'WIDE' || @outcome_type == 'NO_BALL')
  end

  def self.process_bowl_raw_input(raw_input)
    case
    when raw_input == 'WIDE'
      return 'WIDE', 1
    when raw_input == 'NO_BALL'
      return 'NO_BALL', 1
    when raw_input == 'OUT'
      return 'OUT', 0
    else
      return 'SCORE', Integer(raw_input)
    end
  end
end

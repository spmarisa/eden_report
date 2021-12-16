class Bowl
  attr_accessor :id, :batter, :bowler,
                :match, :over_number, :order_number, :outcome_type, :score

  def initialize(bowl_args)
    @id = SecureRandom.uuid
    @batter = bowl_args.batter
    @bowler = bowl_args.bowler
    @match = bowl_args.match
    @over_number = bowl_args.over_number
    @order_number = bowl_args.order_number
    @outcome_type = bowl_args.outcome_type
    @score = bowl_args.score
  end
end

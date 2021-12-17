require 'securerandom'

class Bowl
  attr_accessor :id, :batsman_id, :bowler_id, :match_id,
                :over_number, :bowl_number, :type, :score

  def initialize()
    @id = rand(6000..6999)
  end

  def is_extra_bowl()
    @type == 'WIDE' || @type == 'NO_BALL'
  end

  def is_four()
    @score == 4
  end

  def is_six()
    @score == 6
  end

  def is_out()
    @type =='WICKET'
  end
end

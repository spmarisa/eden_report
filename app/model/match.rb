class Match
  attr_accessor :id, :overs, :team1, :team2, :team1_order, :team2_order,
                :bowls, :state, :outcome, :winner

  def initialize(number_of_overs)
    @id = SecureRandom.uuid
    @overs = number_of_overs
    @state = "STARTING"
  end
end

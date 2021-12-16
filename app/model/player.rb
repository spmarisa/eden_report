class Player
  attr_accessor :id, :name

  def initialize(player_name)
    @id = SecureRandom.uuid
    @name = player_name
  end
end

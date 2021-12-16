require 'securerandom'

class Player
  attr_accessor :id, :name

  def initialize(player_name)
    @id = SecureRandom.uuid
    @name = player_name
  end

  def blah()
    return true
  end
end

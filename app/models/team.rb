require 'securerandom'

class Team
  attr_accessor :id, :name

  def initialize(team_name)
    @id = rand(1000.1999)
    @name = team_name
  end
end

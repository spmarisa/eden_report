require 'securerandom'

class Team
  attr_accessor :id, :name, :batting_order

  def initialize(team_name, batting_order)
    @id = rand(1000..1999)
    @name = team_name
    @batting_order = batting_order
  end
end

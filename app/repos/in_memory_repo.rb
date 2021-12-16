module InMemoryRepo
  # attr_accessor :match

  @@match = nil
  @@teams = []
  @@bowls = []

  def self.all()
    puts @@match.inspect

    puts "************************************"

    puts @@teams.inspect
    puts "************************************"

    puts @@bowls.inspect
  end

  def self.save_match(new_match)
    @@match = new_match
  end

  def self.get_match()
    return @@match
  end

  def self.save_team(new_team)
    @@teams << new_team
  end

  def self.get_teams()
    return @@teams
  end

  def self.save_bowl(new_bowl)
    @@bowls << new_bowl
  end
end

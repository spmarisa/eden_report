module InMemoryRepo
  # attr_accessor :match

  @@match = nil
  @@teams = []

  def self.all()
    puts @@match.inspect
    puts @@team.inspect
  end

  def self.save_match(new_match)
    @@match = new_match
  end

  def self.get_match()
    return @@match
  end

  def self.save_team(new_team)
    @@team << new_team
  end

  def self.get_teams()
    return @@teams
  end
end

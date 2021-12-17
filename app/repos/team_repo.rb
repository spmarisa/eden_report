module TeamRepo

  @@teams_list = []
  @@teams_hash = {}

  def self.save_teams(new_teams)
    @@teams_list += new_teams
    @@teams_list.each { |team| @@teams_hash[team.name] = team }
  end

  def self.get_teams()
    return @@teams_list
  end
end

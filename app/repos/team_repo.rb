module TeamRepo

  @@teams_list = []

  def self.save_teams(new_teams)
    @@teams_list += new_teams
  end

  def self.get_teams()
    return @@teams_list
  end
end

module MatchRepo

  @@match = nil

  def self.save_match(new_match)
    @@match = new_match
  end

  def self.get_match()
    return @@match
  end
end

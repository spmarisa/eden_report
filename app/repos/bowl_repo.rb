module BowlRepo

  @@bowls = []

  def self.save_bowl(new_bowl)
    @@bowls << new_bowl
  end

  def self.get_all_bowls()
    return @@bowls
  end
end

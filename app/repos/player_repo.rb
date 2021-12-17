module PlayerRepo

  @@players = []

  def self.save_player(new_player)
    @@players << new_player
  end

  def self.get_all_players()
    return @@players
  end
end

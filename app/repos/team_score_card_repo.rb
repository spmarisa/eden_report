module TeamScorecardRepo

  @@score_cards = []

  def self.save_score_cards(new_score_cards)
    @@score_cards += new_score_cards
  end
end

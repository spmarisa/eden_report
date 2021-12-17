module PlayerScoreCardRepo

  @@score_cards = []

  def self.save_score_card(new_score_card)
    @@score_cards << new_score_cards
  end
end

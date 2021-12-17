require_relative '../repos/player_repo'
require_relative '../repos/player_score_card_repo'
require_relative '../models/player'
require_relative '../models/player_score_card'
require_relative '../services/match_service'


module PlayerService

  def self.create_players_and_score_cards(team_id, player_names)
    match = MatchService.get_match()

    player_names.each_with_index do |player_name, index|
      player = Player.new(player_name, team_id, index+1)
      score_card = PlayerScoreCard.new(player.id, match.id)

      PlayerRepo.save_player(player)
      PlayerScoreCardRepo.save_score_card(score_card)
    end
  end

  def self.get_player_of_team_by_order(team_id, order_number)
    all_players().find { |player| (player.team_id == team_id && player.batting_order == order_number) }
  end

  def self.get_player_of_team_by_name(team_id, player_name)
    all_players().find { |player| (player.team_id == team_id && player.name == player_name) }
  end

  def self.get_player_by_id(player_id)
    all_players().find { |player| (player.id == player_id) }
  end

  def self.get_players_of_team(team_id)
    all_players().select { |player| (player.team_id == team_id) }
  end

  def self.all_players
    PlayerRepo.get_all_players()
  end

end

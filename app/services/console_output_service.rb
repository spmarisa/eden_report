require 'terminal-table'

require_relative '../services/match_service'
require_relative '../services/player_service'
require_relative '../services/player_score_card_service'


module ConsoleOutputService

  def self.display_player_score_cards(team_id)
    match = MatchService.get_match()
    players = PlayerService.get_players_of_team(team_id)

    rows = []
    players.each do |player|
      score_card = PlayerScoreCardService.get_score_card_by_player_id(player.id)
      rows << [player.name, score_card.score, score_card.fours_scored, score_card.sixes_scored, score_card.bowls_faced]
    end

    table = Terminal::Table.new :headings => ["NAME", "SCORE", "4's", "6's", "Balls"], :rows => rows
    puts table
  end

  def self.display_match_results()
    match = MatchService.get_match()

    if match.outcome == "DRAW"
      puts "Its a draw"
    else
      puts "some team won"
    end
  end


end

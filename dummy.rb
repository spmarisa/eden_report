# def self.create_team_with_players(team_name, player_names)
#   match = MatchService.get_match()
#   players = player_names.map { |player_name| Player.new(player_name) }
#   team = Team.new(team_name, players)
#
#   player_score_cards =  players.map { |player| PlayerScore.new(player, match) }
#
#   InMemoryRepo.save_team(team)
# end
#
# def self.get_team_by_name(team_name)
#   InMemoryRepo.get_teams().find { |team| team.name == team_name }
# end


  # def self.update_match_details_wrt_team(team_name)
  #   team = TeamService.get_team_by_name(team_name)
  #   match = MatchService.get_match()
  #
  #   match.current_batsman = team.players[0]
  #   match.current_over = 1
  #   match.current_over_bowl_number = 1
  #   match.current_playing_batsmen = [team.players[0], team.players[1]]
  # end


  #
  # def self.get_number_of_overs()
  #   InMemoryRepo.get_match().number_of_overs
  # end

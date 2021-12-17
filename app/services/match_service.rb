require_relative '../repos/match_repo'
require_relative '../models/match'
require_relative '../services/team_service'
require_relative '../services/player_service'


module MatchService

  def self.initialize_match(number_of_overs, number_of_players)
    match = Match.new(number_of_overs, number_of_players)
    MatchRepo.save_match(match)
  end

  def self.populate_initial_team_details()
    match = get_match()
    first_team = TeamService.get_team_by_order(1)
    second_team = TeamService.get_team_by_order(2)
    first_player = PlayerService.get_player_of_team_by_order(first_team.id, 1)
    second_player = PlayerService.get_player_of_team_by_order(first_team.id, 2)

    match.batting_team_id = first_team.id
    match.bowling_team_id = second_team.id
    match.striking_batsman_id = first_player.id
    match.non_striking_batsman_id = second_player.id
    match.over_number = 1
    match.bowl_number = 1
    match.state  = "TEAM_1_BATTING"
  end

  def self.get_match()
    MatchRepo.get_match()
  end

  def self.process_event(bowl)
    match = get_match()

    update_over_and_bowl_number()

    change_strike_if_required()

    change_batting_team_if_required()

    print_score_if_required()

    chnage_state_if_required()

    change_outcome_if_required()

    update_winning_team()
  end

end

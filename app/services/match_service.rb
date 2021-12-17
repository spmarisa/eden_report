require_relative '../repos/match_repo'
require_relative '../services/console_output_service'
require_relative '../services/team_score_card_service'
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
    populate_match_with_team_details(match, 1, 2)
    match.state  = "TEAM_1_BATTING"
  end

  def self.get_match()
    MatchRepo.get_match()
  end

  def self.process_event(bowl)
    match = get_match()

    update_over_and_bowl_number(match)

    ConsoleOutputService.display_player_score_cards(match.batting_team_id) if match.is_over_completed()

    if match.is_current_team_batting_over()
      if match.state == "TEAM_2_BATTING"
        match.state == "OVER"
      end

      if match.state == "TEAM_1_BATTING"
        populate_match_with_team_details(match, 2, 1)
        match.state == "TEAM_2_BATTING"
      end

      if match.state == "OVER"
        match.outcome = TeamScoreCardService.are_both_team_scores_same ? "DRAW" : "WIN"
        match.winning_team_id = TeamScoreCardService.team_id_with_highest_score()
        ConsoleOutputService.display_match_results()
      end
    end

    change_strike_if_required(bowl)
    change_player_if_required()
  end

  private
  def self.update_over_and_bowl_number(match)
    if (match.bowl_number == 6)
      match.bowl_number = 0
      match.over_number += 1
    end

    match.bowl_number += 1
  end

  def self.change_strike_if_required(bowl)
    if !bowl.is_out() && bowl.score.odd?
      bowl.striking_batsman_id, bowl.non_striking_batsman_id = bowl.non_striking_batsman_id, bowl.striking_batsman_id
    end
  end

  def self.change_player_if_required(match)
    if bowl.is_out()
      striking_batsman_order = PlayerService.get_player_by_id(match.striking_batsman_id).batting_order
      non_striking_batsman_order = PlayerService.get_player_by_id(match.non_striking_batsman_id).batting_order
      order_of_next_incoming_batsman = [striking_batsman_order, non_striking_batsman_order].max + 1
      match.striking_batsman_id = PlayerService.get_player_of_team_by_order(match.batting_team_id, order_of_next_incoming_batsman)
    end
  end

  def self.populate_match_with_team_details(match, batting_team_order, bowling_team_order)
    first_team = TeamService.get_team_by_order(batting_team_order)
    second_team = TeamService.get_team_by_order(bowling_team_order)
    first_player = PlayerService.get_player_of_team_by_order(first_team.id, batting_team_order)
    second_player = PlayerService.get_player_of_team_by_order(first_team.id, bowling_team_order)

    match.batting_team_id = first_team.id
    match.bowling_team_id = second_team.id
    match.striking_batsman_id = first_player.id
    match.non_striking_batsman_id = second_player.id
    match.over_number = 1
    match.bowl_number = 0
  end

end

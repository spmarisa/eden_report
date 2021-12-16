require_relative 'services/match_service'
require_relative 'utils/constants'

include Constants

module Application

  def self.start()

    number_of_players = get_integer_input("Please enter No. of players for each team:")
    number_of_overs = get_integer_input("Please enter No. of overs for each team:")

    MatchService.initialize_match(number_of_overs)

    # puts MatchService.get_mat ch()
    TOTAL_NUMBER_OF_TEAMS.times do |team_number|
      player_names = get_seq_input_as_array("Please enter player names one after another", number_of_players)

      # puts player_names
      # puts player_names.class
      TeamService.create_team_with_players(String(team_number), player_names)

      # number_of_overs.times do
      #   #  get_ball_by_ball_per_over()
      #   #  display_score()
      # end
    end

    # display_result()
  end

  def self.get_integer_input(message)
    puts message
    integer_input = Integer(gets.chomp())
    # raise ArgumentError, 'Unexpected input, Please give proper input.' if integer_input <= 0
    return integer_input
  end

  def self.get_seq_input_as_array(message, size_of_array)
    puts message
    size_of_array.times.map { gets.chomp() }
  end

  Application.start()
end

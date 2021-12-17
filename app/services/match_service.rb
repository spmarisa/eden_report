require_relative '../repos/in_memory_repo'
require_relative '../models/match'


module MatchService

  def self.initialize_match(number_of_overs, number_of_players)
    match = Match.new(number_of_overs, number_of_players)
    MatchRepo.save_match(match)
  end

  def self.get_match()
    MatchRepo.get_match()
  end
  #
  # def self.get_number_of_overs()
  #   InMemoryRepo.get_match().number_of_overs
  # end
end

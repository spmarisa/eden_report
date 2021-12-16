
module ScoreController

  def self.process_input_bowls()
    number_of_overs = MatchService.get_number_of_overs()

    number_of_overs.times do
    end


        MatchService.get_number_of_overs().times do

          valid_bowls = 0
          while(valid_bowls != 6)
            get_bowl_input
            valid_bowls += 1
          end

           display_score()
        end



  end

end

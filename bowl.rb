# as a bowler I want to be able to start a new game
# as a bowler I want to be able to bowl
# as a bowler I want to be able to be able to see how many pins I knocked out after each bowl
# as a bowler I want to be able to see if I get a spare or a strike
# as a bowler I want to be able to see my score after every frame
# as a bowloer I would like to get some instructions
#as a bowler I would want to be able to mannuall enter how many pins I knock out

# features
# as a bowler I want to have a name?


class Bowl
  attr_reader :score, :frame, :score_board

  def initialize
    @score = 0
    @frame = 0
    @score_board = []
  end

  def bowl(trial1, trial2)
    if trial2 + trial1 <= 10 && trial1 >= 0 && trial2 >= 0
      if @frame < 10
        if trial1 == 10
          @score_board << [trial1, trial2]
          @frame += 1
          "STRIKE!"
        elsif trial1 + trial2 == 10
          @score_board << [trial1, trial2]
          @frame += 1
          "SPARE! #{trial1} / #{trial2}"
        else
          @score_board << [trial1, trial2]
          @frame += 1
          "#{trial1} / #{trial2}"
        end
      else
        "The Game is over buddy! Make a new Game"

      end
    
    else
      "try again! you can knock out a max of only 10 pins per turn and positive numbers"

    end
  end

  def score 
    @score = 0
    next_frame = 0
    @score_board.each do |round|
      next_frame +=1
      if round[0] + round[1] == 10
        @score += 10 + @score_board[next_frame][0]
      else
        @score += round[0] + round[1] 
      end
    end
    @score
  end

end
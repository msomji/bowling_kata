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


end
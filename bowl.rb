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
    @score_board = [[0,0,0]]
  end

  def bowl(trial1, trial2)
    if trial2 + trial1 <= 10 && trial1 >= 0 && trial2 >= 0
      if @frame < 9
        if trial1 == 10
          @score_board.insert(-2, [trial1, trial2])
          @frame += 1
          "STRIKE!"
        elsif trial1 + trial2 == 10
          @score_board.insert(-2, [trial1, trial2])
          @frame += 1
          "SPARE! #{trial1} / #{trial2}"
        else
          @score_board.insert(-2, [trial1, trial2])
          @frame += 1
          "#{trial1} / #{trial2}"
        end

      elsif @frame == 9
        if trial1 == 10
          @score_board.insert(-2, [trial1, 0])
          @frame += 1
          "STRIKE! | You have two more bonus bowl! Use the bonus method to enter your bonus pins"
        elsif trial1 + trial2 == 10
          @score_board.insert(-2, [trial1, trial2])
          @frame += 1
          "SPARE! #{trial1} / #{trial2} | You have one more bonus bowl! Use the bonus method to enter your bonus pins"
        else
          @score_board.insert(-2, [trial1, trial2])
          @frame += 1
          "#{trial1} / #{trial2} | Game Over"
        end
      else
        "The Game is over buddy! Make a new Game"

      end
    
    else
      "try again! you can knock out a max of only 10 pins per turn and positive numbers"

    end
  end

  def bonus(bowl1, bowl2)
    if @frame == 10 && bowl2 + bowl1 <= 10 && bowl1 >= 0 && bowl2 >= 0
      if bowl1 == 10
        @score_board.insert(-2, [bowl1, 0])
          @frame += 1
          "SRIKE | One more Bonus roll!"
      elsif bowl1 + bowl2 == 10
          @score_board.insert(-2, [bowl1, bowl2])
          @frame += 1
          "SPARE! #{bowl1} / #{bowl2} | Game Over"
      else
        @score_board.insert(-2, [bowl1, bowl2])
        @frame += 1
        "#{bowl1} / #{bowl2} | Game Over"
      end
    elsif @frame == 11 && bowl1 >= 0 && @score_board[-2][0] == 10 && @score_board[-3][0] == 10  
      @score_board.insert(-2, [bowl1, 0])
      @frame += 1
      "SRIKE | Awesome!! | Game Over!"
    else
      p score_board.length
      puts "frame"
      p @frame
      "No bonus rounds for you sir"
    end
  end 

  def score 
    @score = 0
    next_frame = 0
    @score_board.each do |round|
      next_frame +=1
      if round[0] == 10 #if it is a strike
          @score += round[0] + @score_board[next_frame][0] + @score_board[next_frame][1]
      elsif round[0] + round[1] == 10 #if spare
        @score += 10 + @score_board[next_frame][0]
      else
        @score += round[0] + round[1] 
      end
    end
    @score
  end

  def reset
    @score = 0
    @frame = 0
    @score_board = [[0,0,0]]
  end

end
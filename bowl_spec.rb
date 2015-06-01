require_relative 'bowl'

describe "Bowl" do
  let(:game) { Bowl.new}
  it "should let you create a new game" do
    expect(game).to be_a Bowl
  end

  it "should have a score of 0 when a new game is created" do
    expect(game.score).to eq(0)
  end

  it "Should start the game at frame 0" do
    expect(game.frame).to eq(0)
  end

  it "Should have an empty score board at creation" do
    expect(game.score_board).to eq([[0,0,0]])
  end

  describe "#bowl" do

    it "should must accept two integers as aguments for number of pins dropped" do
      expect{ game.bowl(2) }.to raise_error(ArgumentError)
    end

    it "should accept 2 integers that are both positive and add up to less than or equal to 10" do
      expect(game.bowl(2,12)).to eq("try again! you can knock out a max of only 10 pins per turn and positive numbers")
    end

    it "should not accept negative integer arguments" do
      expect(game.bowl(-3,4)).to eq("try again! you can knock out a max of only 10 pins per turn and positive numbers")
    end

    it "should return what the user input" do 
      expect(game.bowl(3,3)).to eq("3 / 3")
      end

    it "should tell the user if there was a strike" do
      expect(game.bowl(10,0)).to eq("STRIKE!")
      end
    it "should tell the user if there was a spare" do
      expect(game.bowl(5,5)).to eq("SPARE! 5 / 5")
      end
    it "should store the score on the board" do
      game.bowl(3,3)
      expect(game.score_board).to eq([[3,3],[0,0,0]])
      end
    it "should store every frame within its own array" do 
      4.times do
        game.bowl(3,3)
      end
      expect(game.score_board.length).to eq(5)
      expect(game.score_board).to eq([[3,3],[3,3],[3,3],[3,3],[0,0,0]])
    end
    it "should not allow the user to bowl if 10 turns have already been played" do
      10.times do
        game.bowl(0,0)
      end
      expect(game.bowl(3,3)).to eq("The Game is over buddy! Make a new Game")
    end
    it "should tell the user that the game is over after the end of the tenth frame" do
      9.times do 
        game.bowl(3,2)
      end
      expect(game.bowl(3,2)).to eq("3 / 2 | Game Over")
      expect(game.score).to eq(50)
    end
    it "should calculate the score on tenth frame correctly when no spare or strike" do
      9.times do 
        game.bowl(3,2)
      end
      expect(game.bowl(3,2)).to eq("3 / 2 | Game Over")
      expect(game.score).to eq(50)
    end
  end
  describe "#bonus" do
    it "should tell the user that it doesnt have any bonus rounds unless they are on the 10th frame" do 
      expect(game.bonus(3,3)).to eq("No bonus rounds for you sir")
    end
    it "should tell the user that the game is over if they do not get strike" do
      9.times do
        game.bowl(3,2)
      end
      game.bowl(10,0)
      expect(game.bonus(5,5)).to eq("SPARE! 5 / 5 | Game Over")
    end

  end

  describe "#score" do
    it "should sum the total of a frame and return the score to the user" do
      game.bowl(3,2)
      expect(game.score).to eq(5)
    end

    it "should take into consideration the spare calculations" do
      game.bowl(5,5)
      game.bowl(3,2)
      expect(game.score).to eq(18)
    end
    it "should take into account strike and appropriate calculations" do
      game.bowl(10,0)
      game.bowl(3,2)
      expect(game.score).to eq(20)
    end
    it "should be able to calculate mixture of strikes and spares correctly" do
      game.bowl(10,0)
      game.bowl(5,5)
      game.bowl(3,2)
      expect(game.score).to eq(38)
    end
    it "should calculate score after a spare accurately even if next frame is not populated" do
      game.bowl(5,5)
      expect(game.score).to eq(10)
    end
    
    it "should not break on strike calculations if the next frame is still empty" do
      game.bowl(1,0)
      game.bowl(10,0)
      expect(game.score).to eq(11)
    end
    it "should tell the user that they have 1 more bonus bowl when they get a spare on their 10th frame" do
      9.times do 
        game.bowl(3,3)
      end
      
      expect(game.bowl(5,5)).to eq("SPARE! 5 / 5 | You have one more bonus bowl! Use the bonus method to enter your bonus pins")
    end 
    it "should tell the user that they have 2 more bonus bowls when they get a strike on their 10th frame" do
      9.times do 
        game.bowl(3,3)
      end
      
      expect(game.bowl(10,0)).to eq("STRIKE! | You have two more bonus bowl! Use the bonus method to enter your bonus pins")
    end 
  end

  describe "#reset" do

    it "should allow the user to reset their current game" do
      expect(game.frame).to eq(0)
      game.bowl(3,3)
      expect(game.frame).to eq(1)
      game.bowl(10,0)
      expect(game.frame).to eq(2)
      expect(game.score_board.length).to eq(3)
      game.reset
      expect(game.frame).to eq(0)
      expect(game.score_board.length).to eq(1)
      expect(game.score).to eq(0)
    end
  end


  
end
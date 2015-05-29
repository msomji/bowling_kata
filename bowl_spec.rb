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
    expect(game.score_board).to eq([])
  end

  describe "#bowl" do

    it "should must accept two integers as aguments for number of pins dropped" do
      expect{ game.bowl(2) }.to raise_error(ArgumentError)
    end

    it "should accept 2 integers that are both positive and add up to less than or equal to 10" do
      expect(game.bowl(2,12)).to eq("try again! you can knock out a max of only 10 pins per turn")
    end
  end



  
end
require_relative 'bowl'

describe "Bowl" do

  it "should let you create a new game" do
    expect(Bowl.new).to be_a Bowl
  end

  it "should have a score of 0 when a new game is created" do
    expect(Bowl.new.score).to eq(0)
  end

  it "Should start the game at frame 0" do
    expect(Bowl.new.frame).to eq(0)
  end

  it "Should have an empty score board at creation" do
    expect(Bowl.new.score_board).to eq([])
  end

  describe "#bowl" do

    it "should must accept two integers as aguments for number of pins dropped" do
      expect{ Bowl.new.bowl(2) }.to raise_error(ArgumentError)
    end
  end



  
end
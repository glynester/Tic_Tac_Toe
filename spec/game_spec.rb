require_relative '../lib/player'
require_relative '../lib/game'

describe Game do

  let(:p1) {double(:player1, name: "Player1")}
  let(:p2) {double(:player2, name: "Player2")}



  context "start a new game" do
    it 'has 2 players initialized by default as player1 and player2' do
      g1 = Game.new
      expect(g1.player1.name).to eq "Player1"
      expect(g1.player2.name).to eq "Player2"
    end

    it 'has 2 players initialized by name string' do
      g1 = Game.new("Fred", "George")
      expect(g1.player1.name).to eq "Fred"
      expect(g1.player2.name).to eq "George"
    end

    it 'has 2 players initialized by player object' do
      g1 = Game.new(Player.new("Fred"), Player.new("George"))
      expect(g1.player1.name).to eq "Fred"
      expect(g1.player2.name).to eq "George"
    end

  end

  context "make a move" do

    it 'shows who has made the move and what the move is' do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r1c1")
      expect(g1.moves[0]).to eq [g1.player1, "r1c1"]
    end

    it 'raises an error if someone moves twice' do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r1c1")
      expect{g1.move(g1.player1,"r1c2")}.to raise_error (RuntimeError)

    end


  end

end

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
      expect(g1.moves[0]).to eq [g1.player1, :r1c1]
    end

    it 'raises an error if someone moves twice' do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r1c1")
      expect{g1.move(g1.player1,"r1c2")}.to raise_error(RuntimeError, "Not your go")
    end

    it 'raises an error if someone makes an illegal move' do
      g1 = Game.new("Fred", "George")
      expect{g1.move(g1.player1,"r1c4")}.to raise_error(RuntimeError, "Illegal move")
    end

    it 'raises an error if someone makes a duplicate move' do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r1c1")
      expect{g1.move(g1.player2,"r1c1")}.to raise_error(RuntimeError, "Duplicate move")
    end

  end

  context "Complete a game with no winner" do
    it "shows the game is over" do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r2c2")
      g1.move(g1.player2,"r1c2")
      g1.move(g1.player1,"r2c1")
      g1.move(g1.player2,"r2c3")
      g1.move(g1.player1,"r1c3")
      g1.move(g1.player2,"r3c1")
      g1.move(g1.player1,"r3c3")
      g1.move(g1.player2,"r1c1")
      g1.move(g1.player1,"r3c2")
      expect(g1.log).to include('GAME OVER! No one won!')
    end
  end

  context "Complete a game with a winner" do
    it "shows the game is over if a player completes a horizontal row" do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r2c2")
      g1.move(g1.player2,"r1c2")
      g1.move(g1.player1,"r2c1")
      g1.move(g1.player2,"r1c3")
      g1.move(g1.player1,"r2c3")
      expect(g1.log).to include('GAME OVER! "Fred" won!')
    end

    it "shows the game is over if a player completes a vertical row" do
      g1 = Game.new("Fred", "George")
      g1.move(g1.player1,"r3c1")
      g1.move(g1.player2,"r3c2")
      g1.move(g1.player1,"r1c3")
      g1.move(g1.player2,"r2c2")
      g1.move(g1.player1,"r1c1")
      g1.move(g1.player2,"r1c2")
      expect(g1.log).to include('GAME OVER! "George" won!')
    end
  end

end










#

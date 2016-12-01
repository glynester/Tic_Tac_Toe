require_relative '../lib/player'
require_relative '../lib/game'

describe Game do

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
end

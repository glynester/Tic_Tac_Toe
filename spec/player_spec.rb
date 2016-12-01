require_relative '../lib/player'

describe Player do

  context "add a player" do
    it 'shows correct name' do
      p1 = Player.new("Gill")
      expect(p1.name).to eq "Gill"
    end
  end

end

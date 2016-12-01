require_relative '../lib/player'

class Game

  attr_reader :player1, :player2

  def initialize(player1 = "Player1", player2 = "Player2")
   player1.is_a?(Player) ? @player1 = player1 : @player1 = Player.new(player1)
   player2.is_a?(Player) ? @player2 = player2 : @player2 = Player.new(player2)
   row3_col1=""; row3_col2=""; row3_col3="";
   row2_col1=""; row2_col2=""; row2_col3="";
   row1_col1=""; row1_col2=""; row1_col3="";
  end

end

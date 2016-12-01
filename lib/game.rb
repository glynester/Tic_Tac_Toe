require_relative '../lib/player'

class Game

  attr_reader :player1, :player2, :moves, :log

  def initialize(player1 = "Player1", player2 = "Player2")
   player1.is_a?(Player) ? @player1 = player1 : @player1 = Player.new(player1)
   player2.is_a?(Player) ? @player2 = player2 : @player2 = Player.new(player2)
   @legal_moves = [
   :r3c1, :r3c2, :r3c3,
   :r2c1, :r2c2, :r2c3,
   :r1c1, :r1c2, :r1c3
    ]
   @moves = []
   @log = ""
  end

  def move(player, position)
    position = position.to_sym
    if moves.count > 0
      raise "Not your go" if (@moves.last[0].name == player.name)
      raise "Duplicate move" if move_is_not_a_duplicate?(position)
    end
      raise "Illegal move" if !(move_is_legal?(position))
    @moves << [player, position]
    @log << "#{player.name} just moved to #{position}\n"
  end

  private
  def move_is_not_a_duplicate?(position)
    @moves.each {|v|
      return false if v[0] == position
    }
    return true
  end

  def move_is_legal?(position)
    @legal_moves.include?(position)
  end

  def check_for_winner

  end

end

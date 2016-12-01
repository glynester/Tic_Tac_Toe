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
    if @moves.count > 0
      raise "Not your go" if !players_turn?(player)
      raise "Duplicate move" if move_is_a_duplicate?(position)
    end
      raise "Illegal move" if !(move_is_legal?(position))
    @moves << [player, position]
    @log << "#{player.name} just moved to #{position}\n"
    @log << "GAME OVER! \"#{player.name}\" won!\n" if there_is_a_winner?(player)
    @log << "GAME OVER! No one won!\n" if game_over?
  end

  private
  def players_turn?(player)
    @moves.last[0].name != player.name
  end

  def move_is_a_duplicate?(position)
    @moves.each {|v|
      return true if v[1] == position
    }
    return false
  end

  def move_is_legal?(position)
    @legal_moves.include?(position)
  end

  def game_over?
    @moves.count == 9
  end

  def there_is_a_winner?(player)
    winning_positions = [[:r1c1,:r1c2,:r1c3],[:r2c1,:r2c2,:r2c3],[:r3c1,:r3c2,:r3c3,],
                        [:r1c1,:r2c1,:r3c1],[:r1c2,:r2c2,:r3c2],[:r1c3,:r2c3,:r3c3],
                        [:r1c1,:r2c2,:r3c3],[:r3c1,:r2c2,:r1c3]]
    # p player = player.name
    winning_positions.each {|line|
      line.each{|point|
        points_count = 0
        @moves.each {|v|
          points_count += 1 if ((v[1] == point) && (v[0].name == player.name))
        }
        return true if points_count == 3
      }
    }
    return false
  end

end











#


##Adding players as objects  
```
g = Player.new("Glenn")  
b = Player.new("Bevan")  
g1 = Game.new(b,g)
```

##Adding players by default
```
g1 = Game.new  
g1.move(g1.player1,"r2c2")  
g1.move(g1.player2,"r1c2")  
print g1.log                    # Print the log of the game  
```


##Script - where players are added as strings  
```
load './lib/player.rb'
g1 = Game.new("Fred", "George")  
g1.move(g1.player1,"r2c2")  
g1.move(g1.player2,"r1c2")  
g1.move(g1.player1,"r2c1")  
g1.move(g1.player2,"r1c3")  
g1.move(g1.player1,"r2c3")  
print g1.log                    # Print the log of the game  
```





# Try our Tic Tac Toe Tech Test!

This is a very common tech test as it demonstrates a candidate's knowledge of basic data structures.

## The brief

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

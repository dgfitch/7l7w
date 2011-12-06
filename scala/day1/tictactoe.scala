class Board() {
  // state is either 0 (blank), 1 (X), or 2 (O) -- I couldn't get case classes to work???
  var state = Array(0,0,0,0,0,0,0,0,0) 
  val possibleWins = Array((0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,5,0))

  // I forget who traditionally goes first
  var currentPlayer = 1

  def playerString(x:Int) = {
    if (x == 1) {
      "X"
    } else if (x == 2) {
      "O"
    } else {
      "_"
    }
  }

  def currentPlayerString() = playerString(currentPlayer)

  def isFull() = {
    !(state contains(0))
  }

  def hasWinner() = {
    !( winner().isEmpty )
  }

  def winner() : Option[String] = {
    val flat = possibleWins flatMap { case (x,y,z) =>
        if (state(x) == state(y) && state(x) == state(z) && state(x) > 0) {
          Some(state(x)) 
        } else { 
          None
        } 
    }

    // there has STILL GOT to be a better way to pick 1 Some option from an iterable thing filled with Options
    if (flat.length > 0) {
      Some(playerString(flat(0)))
    } else {
      None
    }
  }


  def playAt(index:Int) {
    state(index) = currentPlayer
    if (currentPlayer == 1) {
      currentPlayer = 2
    } else {
      currentPlayer = 1
    }
  }

  def print() {
    printf("%s | %s | %s\n", playerString(state(0)), playerString(state(1)), playerString(state(2)))
    printf("--+---+--\n")
    printf("%s | %s | %s\n", playerString(state(3)), playerString(state(4)), playerString(state(5)))
    printf("--+---+--\n")
    printf("%s | %s | %s\n", playerString(state(6)), playerString(state(7)), playerString(state(8)))
  }
}

val b = new Board()
while (!b.isFull() && !b.hasWinner()) {
  b.print()
  printf("Need a move from %s (0-indexed lolz):\n", b.currentPlayerString())
  val line = readLine()
  // don't care enough now to add error checking for playing in a spot already taken
  b.playAt(line.toInt)
}

printf("THE WINNER IS %s\n", b.winner())

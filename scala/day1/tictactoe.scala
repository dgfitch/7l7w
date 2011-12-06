class Board() {
  // state is either 0 (blank), 1 (X), or 2 (O) -- I couldn't get case classes to work???
  var state = Array(0,0,0,0,0,0,0,0,0) 
  val possibleWins = Array((0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,5,0))

  // I forget who traditionally goes first
  var currentPlayer = 1

  def isFull() = {
    !(state contains(0))
  }

  def checkSlot(slot:(Int,Int,Int)) = {
    slot match {
      case (x,y,z) =>
        if (state(x) == state(y) && state(x) == state(z) && state(x) > 0) {
          Some(state(x)) 
        } else { 
          None
        } 
    }
  }

  def winner() : Option[Int] = {
    // there has GOT to be a better way to pick 1 Some option from a mapped sequence
    val wins = possibleWins.map { checkSlot } flatten;
    if (wins.length > 0) {
      Some(wins.head)
    } else {
      None
    }
  }

  def playAt(thing:Int, index:Int) {
    state(index) = thing
  }
}

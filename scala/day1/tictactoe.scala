abstract class Mark
case class X() extends Mark
case class O() extends Mark
case class Blank() extends Mark
val b = Blank()

class Board() {
  // Probably not the best way to do this
  var state : Array[Mark] = Array(b,b,b,b,b,b,b,b,b) 
  val possibleWins = Array((0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,5,0))

  // I forget who traditionally goes first
  var currentPlayer = X()

  def isFull() = {
    !(state contains(b))
  }

  def checkSlot(slot:(Int,Int,Int)) = {
    slot match {
      case (x,y,z) =>
        if (state(x) == state(y) && state(x) == state(z)) {
          Some(state(x)) 
        } else { 
          None
        } 
    }
  }

  def winner() : Option[Mark] = {
    val maybeWins = possibleWins.map { checkSlot }
    maybeWins.flatten
  }

  def playAt(thing:Mark, index:Int) {
    state(index) = thing
  }
}

import collection.immutable


// This seems like a silly example - why should I make it a trait, exactly?
trait Censor {
  val words = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
  def mogrify(x: String): String = {
    (x /: words.keys) { (acc, k) => acc.replace(k,words(k)) }
  }
}


class FCC extends Censor

val f = new FCC()

printf("%s\n",f.mogrify("Oh Shoot there friend, Darn and such!"))

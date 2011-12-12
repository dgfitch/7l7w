import scala.io._
import scala.actors._
import scala.xml._
import Actor._

object PageLoader {
  def getPageInfo(url: String) = {
    val content = scala.io.Source.fromURL(url).mkString
    // well, I can't do this, because it expects a SAX-parsable string
    // val xml = XML.loadString(content)
    val anchor = "<a".r
    val countLinks = anchor.findAllIn(content).length
    (content.length, countLinks)
  }
}

val urls = List("http://www.amazon.com",
// Weirdly, if I add reddit to this list, I get some crazy java.nio.charset exception.
// ANNOYING and I don't know enough about the java ecosystem to guess at what's happening.
//                "http://www.reddit.com/",
                "http://www.google.com/",
                "http://www.cnn.com")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageInfo(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, (size,number)) =>
        printf("%s: Size = %s, Links = %s\n", url, size, number)
    }
  }
}

timeMethod { getPageSizeConcurrently }


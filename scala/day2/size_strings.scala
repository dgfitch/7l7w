
val strings = List("HOORAY","OH NO POKEY","I DON'T LIKE THIS SYNTAX","WHAT IS IT LITTLE GIRL")

strings.foldLeft(0)((acc,x) => acc + x.length)


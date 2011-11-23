// IO does have reduce.


array := list(
  list( 1, 6, 7 ),
  list( 10, 66, 77 ),
  list( 100, 666, 777 )
)


List sum := method(self reduce(+))

writeln("Sum: ", array flatten sum)

// Uhh, there already is one, but here is what it might look like
List myAverage := method(
  self sum / self size
)

writeln("Avg: ", array flatten myAverage)

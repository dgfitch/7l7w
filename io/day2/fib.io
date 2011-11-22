
fibr := method(x,
  if(x==1 or x==2, return 1)
  fibr(x - 1) + fibr(x - 2)
)

fibr(1) println
fibr(2) println
fibr(5) println
fibr(10) println

# recursion is definitely not a great idea in io, no tail recursion so this explodes the stack.
# Cool though, because when you CTRL-C the process you get to see the stack! Neat.
#fibr(30) println

fibi := method(x,
  i := 1
  f1 := 0
  f2 := 1
  temp := 0

  # There's almost definitely a more idiomatic way to do this
  # But I'll just use a silly temp variable
  while(i < x, 
    temp = f1
    f1 = f2
    f2 = temp + f1
    i = i + 1
  )

  f2
)

fibi(1) println
fibi(2) println
fibi(5) println
fibi(10) println
fibi(30) println

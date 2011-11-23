Matrix := List clone

Matrix dim := method(x,y,initialValue,
  self x := x
  self y := y

  // I don't know if I was just supposed to let everything start out nil or what

  for(i,0,x,
    row := list()
    for(j,0,y,
      row append(initialValue)
    )
    self append(row)
  )
)

Matrix set := method(x,y,v, self at(x) atPut(y,v))

Matrix get := method(x,y,v, self at(x) at(y))


m := Matrix clone
m dim(2,2,0)

m set(0,0,2)
m set(2,2,1)

m get(2,2) println


// this transposition is kind of ugly but it works

Matrix transpose := method(other,
  this := Matrix clone
  this dim(self x, self y, nil)

  for(i,0,x,
    for(j,0,y,
      this set(i,j, self get(x-i, y-j) )
    )
  )
  this
)

t := m transpose
t get(2,2) println


// now file stuff

Matrix writeFile := method(name, 
  File with(name) open write(self serialized) close
)

Matrix fromList := method(list, 
  self removeAll
  list foreach(x, append(x))
)

Matrix readFile := method(name,
  contents := doString(File with(name) open readLines join)
  newm := Matrix clone
  newm fromList(contents)
  return newm
)


m writeFile("d:/temp/matrix.txt")

restored := Matrix readFile("d:/temp/matrix.txt")
writeln("From file 2,2 is:", restored get(2,2))

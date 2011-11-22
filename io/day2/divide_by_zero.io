/*

I don't know how to test the "before" state,
because by the time this line executes,
it seems like the / slot on Number has already 
been changed.

HUH

*/

42 / 0 println

divide := Number getSlot("/")

Number / := method(d,
  if(d == 0, 0, self divide(d))
)

42 / 0 println

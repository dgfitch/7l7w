
plays(hendrix,guitar).
plays(coltrane,sax).
plays(sharrock,guitar).
plays(monkeby,sax).
plays(ballou,guitar).
plays(segovia,guitar).

genre(hendrix,rock).
genre(coltrane,jazz).
genre(sharrock,jazz).
genre(monkeby,metal).
genre(ballou,metal).
genre(segovia,classical).


instrument_genre(I, G) :- genre(Musician, G), plays(Musician, I).


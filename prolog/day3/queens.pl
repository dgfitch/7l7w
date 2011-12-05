
queens(List) :- length(List, 8).

queen_is_valid(X) :- member(X, [1,2,3,4,5,6,7,8]).

board_is_valid([]).
board_is_valid([X|XS]) :- 
  queen_is_valid(X),
  board_is_valid(XS).

eight_queens(Board) :-
  board_is_valid(Board),

  Range = [1,2,3,4,5,6,7,8],
  InvertedRange = [-1,-2,-3,-4,-5,-6,-7,-8],

  % first check columns are distinct
  distinct(Board),
  
  % now check diagonals
  % theoretically D1 should sum diagonals from lower left to upper right
  % and D1 should be upper left to lower right,
  % but clearly something is not working how I expect here
  Diagonals1 is add_lists(Board,Range),
  Diagonals2 is add_lists(Board,InvertedRange),

  distinct(Diagonals1),
  distinct(Diagonals2).


% ensure all things in a list are distinct
distinct([]) :- true.
distinct([_]) :- true.
distinct([A|[B|Rest]]) :-
  A \= B,
  distinct([A|Rest]),
  distinct([B|Rest]).

invert([A],[B],[C]) :- C is A + B.
add_lists([A],[B],[C]) :- C is A + B.
add_lists([A|AS], [B|BS], [C|Finish]) :-
  C is A + B,
  add_lists(AS,BS,Finish).

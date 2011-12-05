
queens(List) :- length(List, 8).

queen_is_valid(X) :- member(X, [1,2,3,4,5,6,7,8]).

board_is_valid([]).
board_is_valid([X|XS]) :- 
  queen_is_valid(X),
  board_is_valid(XS).

eight_queens(Board) :-
  Range = [1,2,3,4,5,6,7,8],
  InvertedRange = [-1,-2,-3,-4,-5,-6,-7,-8],

  % first check columns are distinct
  distinct(Board),
  sort(Board,Range),
  
  % now check diagonals
  distinct(add_lists(Board,Range)),
  distinct(add_lists(Board,InvertedRange)).


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

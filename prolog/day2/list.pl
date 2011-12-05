
% rev([], []).
% rev([A|[]], [[]|A]).
% rev([A|[B|[]]], [[[]|B]|A]).
% rev([A|[B|[C|[]]]], [[[[]|C]|B]|A]).

% okay, two parameters like that is not going to work
% because we need to keep the original state around to compare against


rev(Orig,Current,[Head|Rest]) :- rev(Orig,[Head|Current],Rest).
rev(X,X,[]).


% rev(Reverse,[],[1,2,3,4]).
% or, interestingly,
% rev([A,B,C],[],[A,B,C]).
% (prolog can deduce from the rules that it doesn't matter what B is, but A = C)


smallest(X,[H,N|Rest]) :- 
  H =< N, 
  smallest(X,[H|Rest]).

smallest(X,[H,N|Rest]) :- 
  H >= N,
  smallest(X,[N|Rest]).

smallest(X,[X]).

% FINALLY JEEEEZ that was harder than I expected



insert_sort(List,Sorted) :- 
  sortacc(List,[],Sorted).

sortacc([],L,L).
sortacc([H|T],L,Sorted) :- 
  insert(H,L,NewL), 
  sortacc(T,NewL,Sorted).

insert(X,[H|T],[X,H|T]) :-
  X =< H.

insert(X,[H|T],[H|NT]) :-
  X > H,
  insert(X,T,NT).

insert(X,[],[X]).

% yuck


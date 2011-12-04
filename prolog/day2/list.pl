
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


smallest(X,[Current,Head|Rest]) :- 
  Head < Current, smallest(Current,Rest).
smallest(X,[Current,Head|Rest]) :- 
  Head >= Current, smallest(X,Rest).

smallest(X,[X]).

% ugh I'm close but not there

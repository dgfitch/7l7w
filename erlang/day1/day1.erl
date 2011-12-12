-module(day1).
-export([word_count/1]).
-export([counting/1]).
-export([matcher/1]).

len_list([]) -> 0;
len_list([_ | Tail]) -> 1 + len_list(Tail).

% it's not cheating to use a library function right? this is still, ahem, a recursive solution...
word_count(Sentence) -> len_list(string:tokens(Sentence,".;:, ")).


% good grief, really? okay fine
counting_helper(List,0) -> List;
counting_helper(List,X) -> counting_helper([X | List], X - 1).

counting(X) -> counting_helper([],X).


matcher(success) -> "success";
matcher({error,Message}) -> "error: " ++ Message.


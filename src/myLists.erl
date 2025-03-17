-module(myLists).
-export([contains/2, duplicateElements/1, sumFloats/1]).

contains([], _) -> false;
contains([Head | Tail], Value) when Head == Value -> true;
contains([_ | Tail], Value) -> contains(Tail, Value).


duplicateElements([]) -> [];
duplicateElements([Head | Tail]) -> [Head, Head | duplicateElements(Tail)].


sumFloats(List) -> sumFloats(List, 0.0).

% Funkcja pomocnicza sumFloats/2
sumFloats([], Acc) -> Acc;
sumFloats([Head | Tail], Acc) when is_float(Head) -> sumFloats(Tail, Acc + Head);
sumFloats([_ | Tail], Acc) -> sumFloats(Tail, Acc).

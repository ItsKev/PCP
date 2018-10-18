mem(X, [X | _]).
mem(X, [_| Tail]) :- mem(X, Tail).
set_difference([], _, []).

set_difference([Head | Tail], Set2, SetDifference) :-
    mem(Head, Set2),
    set_difference(Tail, Set2, SetDifference).
set_difference([Head | Tail], Set2, [Head | SetDifference]) :-
    \+ mem(Head, Set2),
    set_difference(Tail, Set2, SetDifference).

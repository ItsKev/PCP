mem(X, [X | _]).
mem(X, [_| Tail]) :- mem(X, Tail).

% L = [_, _, _], mem(a, L), mem(b, L), mem(c, L), !.

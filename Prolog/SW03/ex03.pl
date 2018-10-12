%a

make_list(X, L, [X | L]).

add_tail(X,[],[X]).
add_tail(X,[Head | Tail],L1) :-
    add_tail(X,Tail,L2),
    make_list(Head, L2, L1).


%b

del([Head | Tail], Head, Tail).

del([Head | Tail], X, L) :-
    del(Tail, X, L1),
    make_list(Head, L1, L).


%c

mem_d(X, L) :- del(L, X, _).

%d

rev_acc([Head | []], A, R) :-
    make_list(Head, A, R).


rev_acc([Head | Tail], A, R) :-
    make_list(Head, A, A1),
    rev_acc(Tail, A1, R).

%e

rev(L, R) :-
    rev_acc(L, [], R).



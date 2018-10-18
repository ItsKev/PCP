female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).% all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim). % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina). % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe). % allchildern of liz
parent(jack, tom). parent(jack, joe). % all childern of jack
parent(mia, ann). % all childern of mia
parent(tina, sue). parent(tina, jim). % all childern of tina
parent(tom, sue). parent(tom, jim). % all childern of tom

mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

sibling(X, Y) :-
    mother(Z, X),
    mother(Z, Y).

grandmother(X, Y) :-
    mother(X, Z),
    parent(Z, Y).

grandfather(X,Y) :-
    father(X, Z),
    parent(Z, Y).

offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :-
    parent(Y, Z),
    offspring(X, Z).


:- use_module(library(clpfd)).
sudoku(Rows) :-
    append(Rows, Vs),
    Vs ins 1..9, maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A, B, C, D, E, F, G, H, I],
    blocks(A, B, C), blocks(D, E, F),
    blocks(G, H, I), maplist(label, Rows).

blocks([], [], []).
blocks([A, B, C|Bs1], [D, E, F|Bs2], [G, H, I|Bs3]) :-
    all_distinct([A, B, C, D, E, F, G, H, I]),
    blocks(Bs1, Bs2, Bs3).

:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
% member(Field=Result,Json),    %Result will get the value of 'Year'

solve(relationship, X) :-
    string_concat('http://localhost:16316/problem/relationship/', X, URL),
    http_get(URL, json(Reply), []),
    member('relationship'=Relationship, Reply),
    member('firstPerson'=First, Reply),
    member('secondPerson'=Second, Reply),
    solve_rel(Relationship, First, Second, X).

solve(sudoku, X) :-
    string_concat('http://localhost:16316/problem/sudoku/', X, URL),
    http_get(URL, json(Reply), []),
    member('sudoku'=Sudoku_0, Reply),
    replace_0(Sudoku_0, Sudoku),
    Sudoku = [A, B, C, D, E, F, G, H, I],
    sudoku([A, B, C, D, E, F, G, H, I]),
    http_post('http://localhost:16316/problem/sudoku/', json(json([solution=[A, B, C, D, E, F, G, H, I], problemKey=X])), _, []),
    !.

solve_rel(Relationship, First, Second, X) :-
    call(Relationship, First, Second),
    http_post('http://localhost:16316/problem/relationship/', json(json([solution=true, problemKey=X])), _, []).

solve_rel(Relationship, First, Second, X) :-
    \+ call(Relationship, First, Second),
    http_post('http://localhost:16316/problem/relationship/', json(json([solution=false, problemKey=X])), _, []).

replace_0(Input, Output) :-
    is_list(Input),
    maplist(replace_0, Input, Output).


replace_0(0, _).
replace_0(X, X).

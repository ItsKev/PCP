female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).% all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim). % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina). % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe). % allchildern of liz
parent(jack, tom). parent(jack, joe). % all childern of jack
parent(mia, ann). % all childern of mia
parent(tina, sue). parent(tina, jim). % all childern of tina
parent(tom, sue). parent(tom, jim). % all childern of tom

% a)
mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

% b)
sibling(X, Y) :-
    mother(Z, X),
    mother(Z, Y).

% c)
grandmother(X, Y) :-
    mother(X, Z),
    parent(Z, Y).

% d)
offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :-
    parent(Y, Z),
    offspring(X, Z).

% ex05
% op(1150, xfx, mother).
% op(1150, xfx, offspring).

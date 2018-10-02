multi(_,X,1,X).
multi(_,0,_,0).
multi(_,_,0,0).

multi(X0, X1, Y1, Z) :-
    X1 > 0,
    Y1 > 1,
    X2 is X1 + X0,
    Y2 is Y1 - 1,
    multi(X0, X2, Y2, Z).

mult(X,Y,Z) :-
    multi(X,X,Y,Z).

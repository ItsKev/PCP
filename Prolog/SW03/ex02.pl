fak_as(0,1).
fak(0, 1).
fak(N, F) :-
    fak_as(N, F),
    !,
    writef("Hinweis: Fakultät von %w war gespeichert", [N]).
fak(N, F) :-
	N > 0,
	N1 is N - 1,
	fak(N1, F1),
	F is N * F1,
        asserta(fak_as(N, F)).

fak_clear :- retractall(fak_as(_, _)).

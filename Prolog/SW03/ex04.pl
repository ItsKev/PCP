p(X):- a(X).
p(X):- b(X), c(X).
p(X):- d(X).
a(1).
b(2). b(3).
c(2). c(3).
d(4).


p1(X):- a(X).
p1(X):- b(X), !, c(X).
p1(X):- d(X).


n(red, yellow).
n(red, green).
n(green, yellow).
n(green, red).
n(yellow, red).
n(yellow, green).

color(LU,NW,OW,SZ,UR,ZG) :-
    UR = yellow,
    SZ = red,
    n(LU, ZG), n(LU, SZ), n(LU, NW), n(LU, OW),
    n(ZG, LU), n(ZG, SZ),
    n(SZ, UR), n(SZ, NW),
    n(UR, NW),
    n(NW, OW), n(OW, UR).

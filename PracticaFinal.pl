% the method paraula receivs a list of atoms and returns every atom parsed
% paraula([],0).


:-consult(auxiliar).
paraula(X):- 
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,X),
    write(X),
    nl, fail.

paraula(X):-
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,Z),
    reverse(Z,X),
    write(X),
    nl, fail.

% Repetides es clausula que recibe una lista de atomos y devuelve true si hay algun elemento repetido en la lista
repetides(X):-
    sort(X,Y),
    length(Y,N),
    length(X,M),
    N==M.

% mostra(X, Fila, Columna, vertical): -
%     gotoXY(Fila, Columna),

%     nl.

mostra([X|Y], F, C, horitzontal):-
    gotoXY(F, C),
    escriu(X,blau),
    C1 is C+3,
    mostra(Y, F, C1, horitzontal).

mostra([X|Y], F, C, vertical):-
    gotoXY(F, C),
    escriu(X,vermell),
    F1 is F+2,
    mostra(Y, F1, C, vertical).

% delete first item in list
% first([X|Xs], Xs).
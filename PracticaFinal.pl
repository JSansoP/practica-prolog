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

creuats():-
  paraula(PH1),
  length(PH1,7),

  paraula(PV1),
  length(PV1,11),
  repetides([PH1, PV1]),
  nth1(5,PH1,nth1(1,PV1,_)),

  paraula(PH2),
  length(PH2,5),
  repetides([PH1, PH2, PV1]),
  nth1(3,PV1,nth1(3,PH2,_)),

  paraula(PH3), 
  length(PH3,7),
  repetides([PH1, PH2, PH3, PV1]),
  nth1(5,PH3,nth1(11,PV1,_)),

  paraula(PV2),
  length(PV2,3),
  repetides([PH1, PH2, PH3, PV1, PV2]),
  nth1(7,PH3,nth1(3,PV2,_)),

  paraula(PV3),
  length(PV3,8),
  repetides([PH1, PH2, PH3, PV1, PV2, PV3]),

  paraula(PH4),
  length(PH4,10),
  repetides([PH1, PH2, PH3, PH4, PV1, PV2, PV3]),

  paraula(PH5),
  length(PH5,8),
  repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3]),

  paraula(PV4),
  length(PV4,6),
  repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4]),

  paraula(PV5),
  length(PV5,8),
  repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5]),

  paraula(PV6),
  length(PV6,8),
  repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5, PV6]),

  paraula(PH6),
  length(PH6,6),
  repetides([PH1, PH2, PH3, PH4, PH5, PH6, PV1, PV2, PV3, PV4, PV5, PV6]),

  paraula(PH7),
  length(PH7,5),
  repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6]),

  paraula(PV7),
  length(PV7,5),
  repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6, PV7]),



% delete first item in list
% first([X|Xs], Xs).
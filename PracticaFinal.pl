% the method paraula receivs a list of atoms and returns every atom parsed
% paraula([],0).


:-consult(auxiliar).
paraula(X):-
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,X).

paraula(X):-
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,Z),
    reverse(Z,X).

% Repetides es clausula que recibe una lista de atomos y devuelve true si hay algun elemento repetido en la lista
% Falta chequear que no haya ningun elemento repetido al reves
repetides([X|Y]):- member(X,Y),!.

repetides([_|Y]):- repetides(Y),!.

repetides([X|Y]):-
    reverse(X,A),
    member(A,Y),!.


mostra([X|Y], F, C, horitzontal):-
    gotoXY(F, C),
    escriu(X,blau),
    C1 is C+3,
    mostra(Y, F, C1, horitzontal), true.

mostra([X|Y], F, C, vertical):-
    gotoXY(F, C),
    escriu(X,vermell),
    F1 is F+2,
    mostra(Y, F1, C, vertical), true.

creuats():-
  paraula(PH1),
  length(PH1, 7),

  paraula(PV1),
  length(PV1,11),
  not(repetides([PH1, PV1])),
  nth1(5,PH1,A),
  nth1(1,PV1,A),

  paraula(PH2),
  length(PH2,5),
  not(repetides([PH1, PH2, PV1])),
  nth1(3,PV1,B),
  nth1(3,PH2,B),

  paraula(PH3),
  length(PH3,7),
  not(repetides([PH1, PH2, PH3, PV1])),
  nth1(5,PH3,C),
  nth1(11,PV1,C),

  paraula(PV2),
  length(PV2,3),
  not(repetides([PH1, PH2, PH3, PV1, PV2])),
  nth1(7,PH3,D),
  nth1(3,PV2,D),

  paraula(PV3),
  length(PV3,8),
  not(repetides([PH1, PH2, PH3, PV1, PV2, PV3])),
  nth1(6,PV3,E),
  nth1(3,PH3,E),

  paraula(PH4),
  length(PH4,10),
  not(repetides([PH1, PH2, PH3, PH4, PV1, PV2, PV3])),
  nth1(6,PH4,F),
  nth1(8,PV3,F),

  paraula(PH5),
  length(PH5,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3])),
  nth1(8,PH5,G),
  nth1(1,PV3,G),

  paraula(PV4),
  length(PV4,6),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4])),
  nth1(4,PV4,H),
  nth1(6,PH5,H),


  paraula(PV5),
  length(PV5,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5])),
  nth1(5,PV5,I),
  nth1(4,PH5,I),


  paraula(PV6),
  length(PV6,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(1,PV6,J),
  nth1(1,PH5,J),


  paraula(PH6),
  length(PH6,6),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(6,PH6,K),
  nth1(3,PV5,K),


  paraula(PH7),
  length(PH7,5),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(2,PH7,L),
  nth1(6,PV6,L),


  paraula(PV7),
  length(PV7,5),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6, PV7])),
  nth1(1,PV7,M),
  nth1(1,PH6,M),
  nl,nl,nl,nl,
  write(PH1),
  write(PH2),
  write(PH3),
  write(PH4),
  write(PH5),
  write(PH6),
  write(PH7),
  write(PV1),
  write(PV2),
  write(PV3),
  write(PV4),
  write(PV5),
  write(PV6),
  write(PV7), fail,
    nl,nl,nl,
  % mostra(PH1, 1, 8, horitzontal),
  mostra(PH2, 7, 10, horitzontal),
  mostra(PH3, 30, 8, horitzontal),
  mostra(PH4, 36, 5, horitzontal),
  mostra(PH5, 16, 3, horitzontal),
  mostra(PH6, 10, 1, horitzontal),
  mostra(PH7, 30, 2, horitzontal),
  mostra(PV1, 1, 12, vertical),
  mostra(PV2, 24, 14, vertical),
  mostra(PV3, 16, 10, vertical),
  mostra(PV4, 7, 8, vertical),
  mostra(PV5, 4, 6, vertical),
  mostra(PV6, 16, 3, vertical),
  mostra(PV7, 10, 1, vertical).
    % nl.



% delete first item in list
% first([X|Xs], Xs).

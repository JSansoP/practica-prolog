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

paraula2(X):-
    paraula(_,_,P,nom,comu,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,X);
    paraula(_,_,P,adjectiu,_,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,X);
    paraula(_,_,P,verb,_,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,X).

paraula2(X):-
    paraula(_,_,P,nom,comu,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,Z),
    reverse(Z,X);
    paraula(_,_,P,adjectiu,_,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,Z),
    reverse(Z,X);
    paraula(_,_,P,verb,_,_,_,_,_,_,_,_,_,_,_),
    atom_chars(P,Z),
    reverse(Z,X). 

% Repetides es clausula que recibe una lista de atomos y devuelve true si hay algun elemento repetido en la lista
% Falta chequear que no haya ningun elemento repetido al reves
repetides([X|Y]):- member(X,Y),!.

repetides([_|Y]):- repetides(Y),!.

repetides([X|Y]):-
    reverse(X,A),
    member(A,Y),!.

mostra([], _, _, _).

mostra([X|Y], F, C, horitzontal):-
    gotoXY(F, C),
    escriu(X, blau),
    C1 is C+2,
    mostra(Y, F, C1, horitzontal).

mostra([X|Y], F, C, vertical):-
    gotoXY(F, C),
    escriu(X, vermell),
    F1 is F+2,
    mostra(Y, F1, C, vertical).

creuats:-
  cls,
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

  mostra(PH1, 1, 15, horitzontal),
  mostra(PH2, 5, 19, horitzontal),
  mostra(PH3, 21, 15,horitzontal),
  mostra(PH4, 25, 9, horitzontal),
  mostra(PH5, 11, 5, horitzontal),
  mostra(PH6, 7, 1, horitzontal),
  mostra(PH7, 21, 3, horitzontal),
  mostra(PV1, 1, 23, vertical),
  mostra(PV2, 17, 27, vertical),
  mostra(PV3, 11, 19, vertical),
  mostra(PV4, 5, 15, vertical),
  mostra(PV5, 3, 11, vertical),
  mostra(PV6, 11, 5, vertical),
  mostra(PV7, 7, 1, vertical),
  gotoXY(30,0).



%   mostra(PH1, 1, 15,horitzontal),
%   mostra(PH2, 7, 19,horitzontal),
%   mostra(PH3, 31, 15,horitzontal),
%   mostra(PH4, 37, 9,horitzontal),
%   mostra(PH5, 16, 5,horitzontal),
%   mostra(PH6, 10,1,horitzontal),
%   mostra(PH7, 31, 3,horitzontal),
%   mostra(PV1, 1, 23, vertical),
%   mostra(PV2, 25, 27, vertical),
%   mostra(PV3, 16,19, vertical),
%   mostra(PV4, 7, 15, vertical),
%   mostra(PV5, 4, 11, vertical),
%   mostra(PV6, 16,5, vertical),
%   mostra(PV7, 10, 1, vertical).
    % nl.




% delete first item in list
% first([X|Xs], Xs).

creuats2:-
  cls,
  paraula2(PH1),
  length(PH1, 7),

  paraula2(PV1),
  length(PV1,11),
  not(repetides([PH1, PV1])),
  nth1(5,PH1,A),
  nth1(1,PV1,A),

  paraula2(PH2),
  length(PH2,5),
  not(repetides([PH1, PH2, PV1])),
  nth1(3,PV1,B),
  nth1(3,PH2,B),

  paraula2(PH3),
  length(PH3,7),
  not(repetides([PH1, PH2, PH3, PV1])),
  nth1(5,PH3,C),
  nth1(11,PV1,C),

  paraula2(PV2),
  length(PV2,3),
  not(repetides([PH1, PH2, PH3, PV1, PV2])),
  nth1(7,PH3,D),
  nth1(3,PV2,D),

  paraula2(PV3),
  length(PV3,8),
  not(repetides([PH1, PH2, PH3, PV1, PV2, PV3])),
  nth1(6,PV3,E),
  nth1(3,PH3,E),

  paraula2(PH4),
  length(PH4,10),
  not(repetides([PH1, PH2, PH3, PH4, PV1, PV2, PV3])),
  nth1(6,PH4,F),
  nth1(8,PV3,F),

  paraula2(PH5),
  length(PH5,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3])),
  nth1(8,PH5,G),
  nth1(1,PV3,G),

  paraula2(PV4),
  length(PV4,6),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4])),
  nth1(4,PV4,H),
  nth1(6,PH5,H),

  paraula2(PV5),
  length(PV5,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5])),
  nth1(5,PV5,I),
  nth1(4,PH5,I),


  paraula2(PV6),
  length(PV6,8),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(1,PV6,J),
  nth1(1,PH5,J),


  paraula2(PH6),
  length(PH6,6),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(6,PH6,K),
  nth1(3,PV5,K),


  paraula2(PH7),
  length(PH7,5),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6])),
  nth1(2,PH7,L),
  nth1(6,PV6,L),


  paraula2(PV7),
  length(PV7,5),
  not(repetides([PH1, PH2, PH3, PH4, PH5, PH6, PH7, PV1, PV2, PV3, PV4, PV5, PV6, PV7])),
  nth1(1,PV7,M),
  nth1(1,PH6,M),

  mostra(PH1, 1, 15, horitzontal),
  mostra(PH2, 5, 19, horitzontal),
  mostra(PH3, 21, 15,horitzontal),
  mostra(PH4, 25, 9, horitzontal),
  mostra(PH5, 11, 5, horitzontal),
  mostra(PH6, 7, 1, horitzontal),
  mostra(PH7, 21, 3, horitzontal),
  mostra(PV1, 1, 23, vertical),
  mostra(PV2, 17, 27, vertical),
  mostra(PV3, 11, 19, vertical),
  mostra(PV4, 5, 15, vertical),
  mostra(PV5, 3, 11, vertical),
  mostra(PV6, 11, 5, vertical),
  mostra(PV7, 7, 1, vertical),
  gotoXY(30,0).




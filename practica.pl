%==============================================================================
%               Práctica 2 -  Llenguatges de Programació (2721)               %
%==============================================================================

                        %======== ALUMNES ========%
                        %   Joan Sansó Pericàs    %
                        %   Joan Vilella Candia   %
                        %   Julián Wallis Medina  %
                        %=========================%

                        %====== PROFESSORS =======%
                        %   Dr. Ramon Mas Sansó   %
                        %   Dra. Xisca Roig Maimó %
                        %=========================%

%==============================================================================
% Hem duit a terme la segona pràctica de l'assignatura, que consisteix en
% escriure una serie de predicats per resoldre el joc dels mots creuats sobre un
% tauler de joc, predefinit.
%==============================================================================

%==============================================================================
% Llegim les clausules del fitxer auxiliar proporcionat pels professors.
:-consult(auxiliar).

%==============================================================================
% Predicats corresponents a l'apartat 1.
% Ens retorna una llista de paraules, tant a l'endret com al revés
paraula(X):-
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse,
         elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,X).

paraula(X):-
    member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse,
         elevarse, escuela, cuerpo, jugar, juicio, error, vicio, rea]),
    atom_chars(Y,Z),
    reverse(Z,X).

%==============================================================================
% Predicats corresponents a l'apartat 5.
% Ens retorna una llista de paraules, provenint del fitxer diccionari.
% Les paraules poden ser nom comuns, adjectius i verbs.
% Les paraules poden estar tant a l'endret com al revés.
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

%==============================================================================
% Predicats corresponent a l'apartat 2
% Retorna veritat si dins una llista de paraules n'hi ha qualcuna de repetida.
% També comprovam que no hi hagi paraules repetides al revés.
repetides([X|Y]):- member(X,Y),!.

repetides([X|Y]):-
    reverse(X,A),
    member(A,Y),!.

repetides([_|Y]):- repetides(Y),!.


%==============================================================================
% Predicats corresponents a l'apartat 3.
% Donada una paraula, una posició a la pantalla i la seva orientació, mostra
% per pantalla dita paraula en la posició i orientació indicada.
% Si la paraula és horitzontal es mostra de color blau i si és vertical de
% color vermell.
% Per dur a terme això hem emprat dues clausules auxiliars: gotoXY(F, C) i
% escriu(X, color).
% Hem cambiat el espaiat respecte al que se'ns indica en l'enunciat, ja que
% a la nostra pantalla es veia massa espaiat (Pot ser que això sigui degut a
% la font del text).
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

%==============================================================================
% Predicat corresponents a l'apartat 4.
% Resol el puzzle dels mots creuats amb les paraules definides.
% Hem seguit la següent mecànica:
% 1. Agafam una paraula
% 2. Ens asseguram que és de la mida correcta
% 3. Ens asseguram que no estigui repetida.
% 4. Ens asseguram que cumpleix les restriccions d'encreuament amb les altres
%    paraules.
% Un pic les tenim totes les mostram per pantalla.
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

  % Mostram les paraules
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

  % Pintam les lletres creuades de color lila (vermell + blau = lila)
  gotoXY(1, 23), escriu(A, lila),
  gotoXY(5, 23), escriu(B, lila),
  gotoXY(21, 23), escriu(C, lila),
  gotoXY(21, 27), escriu(D, lila),
  gotoXY(21, 19), escriu(E, lila),
  gotoXY(25, 19), escriu(F, lila),
  gotoXY(11, 19), escriu(G, lila),
  gotoXY(11, 15), escriu(H, lila),
  gotoXY(11, 11), escriu(I, lila),
  gotoXY(11, 5), escriu(J, lila),
  gotoXY(7, 11), escriu(K, lila),
  gotoXY(21, 5), escriu(L, lila),
  gotoXY(7, 1), escriu(M, lila),

  gotoXY(30,0).

%==============================================================================
% Predicat corresponent a l'apartat 5.
% Seguim la mateixa mecànica que per l'apartat 4, però ara les paraules son
% creades amb la clausula paraula2, que ens agafa paraules del fitxer diccionari
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

  % Pintam les lletres creuades de color lila (vermell + blau = lila)
  gotoXY(1, 23), escriu(A, lila),
  gotoXY(5, 23), escriu(B, lila),
  gotoXY(21, 23), escriu(C, lila),
  gotoXY(21, 27), escriu(D, lila),
  gotoXY(21, 19), escriu(E, lila),
  gotoXY(25, 19), escriu(F, lila),
  gotoXY(11, 19), escriu(G, lila),
  gotoXY(11, 15), escriu(H, lila),
  gotoXY(11, 11), escriu(I, lila),
  gotoXY(11, 5), escriu(J, lila),
  gotoXY(7, 11), escriu(K, lila),
  gotoXY(21, 5), escriu(L, lila),
  gotoXY(7, 1), escriu(M, lila),


  gotoXY(30,0).




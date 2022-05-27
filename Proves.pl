elements([],0).
elements([_|Y],N):-elements(Y,N1), N is N1+1.

entre(LB,UB,E):- between(LB,UB,E).


pertany(X,[X|_]).
pertany(X,[_|L]):-pertany(X,L).

afegir([],[],[]).
afegir([],L,L).
afegir([X|L1],L2,[X|L3]):-afegir(L1,L2,L3).

invertir([],[]).
invertir([X|L],L2):-invertir(L,L1),afegir(L1,[X],L2).

sumar([],0).
sumar([X|L],N):- sumar(L,N1), N is N1+X.

maxim([X],X).
maxim([X,Y|L],Z):- Y>=X, !,maxim([Y|L],Z).
maxim([X,_|L],Z):- maxim([X|L],Z).

insertar(X,L,[X|L]).
insertar(X,[Y|L],[Y|Z]):-insertar(X,L,Z).

permutacio([],[]).
permutacio([X|L],Z):-permutacio(L,L1), insertar(X,L1,Z).

factorial(0,1).
factorial(N,X):- A is N-1, factorial(A,Y), X is N*Y.

digit(X):- between(1,9,X).

rebaixes(P,C,M):-
    MaxPantalons is 500//25,
    MaxCamisetes is 500//5,
    MaxMocadors is 500*4,
    entre(1,MaxPantalons,P),
    entre(1,MaxCamisetes,C),
    entre(1,MaxMocadors,M),
    T is ceiling(P*25+C*5+M//4), T=500,
    R is T-P*25-C*5-M*0.25,
    write("S

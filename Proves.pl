elements([],0).
elements([_|Y],N):-elements(Y,N1), N is N1+1.

pertany(X,[X|_]).
pertany(X,[_|L]):-pertany(X,L).

afegir([],[],[]).
afegir([],L,L).
afegir([X|L1],L2,[X|L3]):-afegir(L1,L2,L3).

invertir([],[]).
invertir([X|L],L2):-invertir(L,L1),afegir(L1,[X],L2).


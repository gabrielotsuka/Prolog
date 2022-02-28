% 0: lado esquerdo do rio
% 1: lado direito do rio

/* indexes
    0: Fazendeiro
    1: Lobo
    2: Carneiro
    3: Repolho 
*/

inicio(0/0/0/0).
meta(1/1/1/1).

resolve(P) :-
    inicio(S),
    busca(S,[S],Q),
    reverse(Q,P).

busca(S,P,P) :- meta(S), !.

busca(S,Visitados,P) :-
    proximo_estado(S,N),
    permitido(N),
    \+member(N,Visitados),
    busca(N,[N|Visitados],P).

permitido(F/L/O/R) :-
    F>=0,F=<1,
    L>=0,L=<1,
    O>=0,O=<1,
    R>=0,R=<1,
    (L\==O; (L==O, L==F)),
    (O\==R; (O==R, O==F)).

proximo_estado(X,Y) :-
    passo(X,_,Y).

passo(F/L/O/R, fd, F1/L/O/R) :-
    F1 is F+1.

passo(F/L/O/R, fe, F1/L/O/R) :-
    F1 is F-1.

passo(F/L/O/R, ld, F1/L1/O/R) :-
    L1 is L+1,
    F1 is F+1.

passo(F/L/O/R, le, F1/L1/O/R) :-
    L1 is L-1,
    F1 is F-1.

passo(F/L/O/R, od, F1/L/O1/R) :-
    O1 is O+1,
    F1 is F+1.

passo(F/L/O/R, oe, F1/L/O1/R) :-
    O1 is O-1,
    F1 is F-1.

passo(F/L/O/R, rd, F1/L/O/R1) :-
    R1 is R+1,
    F1 is F+1.

passo(F/L/O/R, re, F1/L/O/R1) :-
    R1 is R-1,
    F1 is F-1.
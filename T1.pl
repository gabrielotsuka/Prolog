n_esimo_pa_cauda(1,P1,_,P1):-!.
n_esimo_pa_cauda(Pos,P1,Ra, R1):-
    Pos>1,
    Pos1 is Pos-1,
    P2 is P1+Ra,
    n_esimo_pa(Pos1,P2,Ra,R1).

n_esimo_pa(1,P1,_,P1):-!.
n_esimo_pa(Pos,P1,Ra,R) :-
    Pos>1,
    Pos1 is Pos-1,
    n_esimo_pa_cauda(Pos1,P1,Ra,R1),
    R is Ra+R1.

soma_pa(1,P1,_,P1).
soma_pa(Pos,P1,Ra,R):-
    Pos > 1,
    n_esimo_pa(Pos,P1,Ra,R1),
    Pos1 is Pos - 1,
    soma_pa(Pos1,P1,Ra,R2),
    R is R1 + R2, !.

soma_pa_cauda(N,P1,Ra,R):-
   soma_pa_cauda_ax(N,1,P1,P1,Ra,R), !.
soma_pa_cauda_ax(N,N,Acc,_,_,Acc).
soma_pa_cauda_ax(N,I,Acc,Pi,Ra,R):-
    I < N,
    I1 is I + 1,
    Pi1 is Pi + Ra,
    Acc1 is Acc + Pi1,
    soma_pa_cauda_ax(N,I1,Acc1,Pi1,Ra,R).

%1.?-[X]=[a].
%X = a.

%2.?-X=[ ].
%X = [].

%3.?-[X]=[ ].
%false.

%4.?-X=[a].
%X=[a].

%5.?-[X,Y]=[a].
%false.

%6.?-[X,Y]=[a,b].
%X=a,
%Y=b.

%7.?-[X,Y]=[a,b,c].
%false.

%8.?-[X,Y,Z]=[a,b,c].
%X=a,
%Y=b,
%Z=c.

%9.?-[X,Y,X]=[a,b,c].
%false.

%10.?-[X,Y,X]=[a,b,a].
%X = a,
%Y = b.

%11.?-[X|Y]=[a].
%X = a,
%Y = [].

%12.?-[X|Y]=[ ].
%false.

%13.?-[X|Y]=[a,b,c].
%X= a,
%Y= [b,c].

%14.?-[X,Y|Z]=[a,b,c].
%X=a,
%Y=b,
%Z=[c].

%15.?-[X,Y|Z]=[a,b].
%X=a,
%Y=b,
%Z=[].

%16.?-[X,Y|Z]=[a].
%false.

%17.?-[X,Y|Z]=[a,b,c,d].
%X=a,
%Y=b,
%Z=[c,d].

%18.?-[X,Y|Z]=[a,b,a].
%X=a,
%Y=b,
%Z=[a].

%19.?-[X,Y|Z]=[[a],b,a].
%X=[a],
%Y=b,
%Z=[a].

n_esimo(1,R,[R|_]):-!.
n_esimo(N,R,[_|Y]):-
    N>1,
    N1 is N-1,
    n_esimo(N1,R,Y).

no_elementos([],0).
no_elementos([_|Y],N):-
    no_elementos(Y,N1),
    N is N1+1.

tire_elemento(X,[X|Y],Y):-!.
tire_elemento(X,[Y|Z],[Y|R1]):-
    X\==Y,
    tire_elemento(X,Z,R1).

retirar_ocor(_,[],[]).
retirar_ocor(X,[X|Y],R):-
    retirar_ocor(X,Y,R),!.
retirar_ocor(X,[Y|Z],[Y|R1]):-
    X\==Y,
    retirar_ocor(X,Z,R1),!.

retire_repet([],[]).
retire_repet([X|Y],R):-
	retire_repet(Y,R1),
	retirar_ocor(X,R1,R2),
	inserir_cabeça(X,R2,R),!.

concatenar([],L,L).
concatenar([X|Y],L,R):-
    concatenar(Y,L,R1),
    R = [X|R1].

maior([X],X).
maior([X,Y|Z],R):-
    X>Y,
    maior([X|Z],R),!.
maior([X,Y|Z],R):-
    Y>X,
    maior([Y|Z],R),!.

menor([X],X).
menor([X,Y|Z],R):-
    X<Y,
    menor([X|Z],R),!.
menor([X,Y|Z],R):-
    Y<X,
    menor([Y|Z],R),!.

pegar([],_,[]).
pegar([X|Y],[W|Z],R):-
    pegar(Y,[W|Z],R2),
    n_esimo(X,R1,[W|Z]),
    inserir_cabeça(R1,R2,R).

inserir_cabeça(X,A,[X|A]).

inserir_N(X,1,A,[X|A]):-!.
inserir_N(X,N,[Y|Z],[Y|R1]):-
    N1 is N-1,
    inserir_N(X,N1,Z,R1).

inverter([],[]).
inverter([X|Y],R):-
    inverter(Y,R1),
    append(R1,[X],R).

substitui(X,Y,[X|Z],[Y|Z]):-!.
substitui(X,Y,[W|Z],[W|R1]):-
    substitui(X,Y,Z,R1).

duplicar_todos([],[]).
duplicar_todos([X|Y],[X,X|R1]):-
    duplicar_todos(Y,R1).

duplicar_um(X,[X|Y],[X,X|Y]):-!.
duplicar_um(X,[Y|W],[Y|R1]):-
    duplicar_um(X,W,R1).

pertence(N,[N|_]):-!.
pertence(N,[_|Y]):-
    pertence(N,Y).

nao_vazia([X|_],[W|Z]):-
    pertence(X,[W|Z]),!.
nao_vazia([_|Y],[W|Z]):-
    nao_vazia(Y,[W|Z]).

uniao(A,[],A).
uniao(A,[W|Z],R):-
    not(pertence(W,A)),
    uniao([W|A],Z,R),!.
uniao(A,[W|Z],R):-
    pertence(W,A),
    uniao(A,Z,R),!.

disjuntos(A,B):-
    not(nao_vazia(A,B)).

insere_ord(Z,[],[Z]).
insere_ord(X,[Y|W],[X|[Y|W]]):-
	X =< Y.
insere_ord(X,[Y|W],[Y|R1]):-
	X>Y,
	insere_ord(X,W,R1).

ordenada([],[]).
ordenada([X|Y], L):-
	ordenada(Y,L1),
	insere_ord(X,L1,L),!.

iguais(A,B):-
    ordenada(A,R1),
    ordenada(B,R2),
    iguais_aux(R1,R2).
iguais_aux([],[]).
iguais_aux([X|Y],[W|Z]):-
    X == W,
    iguais(Y,Z).

concat([],L,L).
concat([X|Y],L,[X|R1]):-
    concat(Y,L,R1).

um([X],X):-!.
um([_|Y],R):-
    um(Y,R).

dois([X,_],X):-!.
dois([_|Y],R):-
    dois(Y,R).

tres(X,[X|_],1):-!.
tres(R,[_|Y],N):-
    N > 1,
    N1 is N - 1,
    tres(R,Y,N1).

quatro([],0).
quatro([_|Y],R):-
    quatro(Y,R1),
    R is R1 + 1.

cinco([],[]).
cinco([X|Y],R):-
    cinco(Y,R1),
    concat(R1,[X],R).

seis([X|Y]):-
    cinco([X|Y],R),
    [X|Y]=R.

%sete([],[]).
%sete([X|_],R):-
%    is_list(X),
%    sete(X,R),!.
%sete([X|Y],R):-
%    not(is_list(X)),
%    sete(Y,R1),
%    concat([X],R1,R),!.

oito()

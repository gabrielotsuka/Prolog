inicio([]).
meta(N) :- length(N, 4).

resolve2(S) :-
    inicio(I),
    busca([[I]],[S|_]),
    printa_linhas(S).

busca([[N|R]|_],[N|R]) :-
    meta(N).
busca( [Cam | OutrosCam], S) :-
    extend( Cam, NovosCam),
    append( OutrosCam, NovosCam, Cams1),
    busca( Cams1, S).

extend( [No | Resto], NovosCams) :-
    setof( 
        [Novo, No | Resto],
        ( proximo_estado( No, Novo), \+member( Novo, [No |Resto] ), estado_valido(Novo) ),
        NovosCams
    ), !.
extend( _, [] ).

proximo_estado(No,[X|No]) :- member(X,[1,2,3,4]).

estado_valido([]).
estado_valido([Q1|Q2]) :- naoAtaca(Q1,Q2,1).

naoAtaca(_,[],_).
naoAtaca(X,[Y|Z],D) :- X\=Y, D1 is abs(X-Y), D1\=D, D2 is D+1, naoAtaca(X,Z,D2).

printa_linhas([]).

printa_linhas([1|L]) :-
    write('[1,0,0,0]\n'),
    printa_linhas(L).

printa_linhas([2|L]) :-
    write('[0,1,0,0]\n'),
    printa_linhas(L).

printa_linhas([3|L]) :-
    write('[0,0,1,0]\n'),
    printa_linhas(L).

printa_linhas([4|L]) :-
    write('[0,0,0,1]\n'),
    printa_linhas(L).

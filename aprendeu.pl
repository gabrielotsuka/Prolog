:-dynamic (telefone/2).

menu:-
    consult('telefone.pl'),
    repeat,
    write('1- listar usuarios.'),nl,
    write('2- numero de usuarios.'),nl,
    write('3- adicionar usuario.'),nl,
    write('4- remover usuario.'),nl,
    write('5- finalizar.'),nl,
    le_atomo(Op),
    (Op = 5,write('Finalizando...'),nl,!;verifica(Op),fail).

le_atomo(A):-
	le_str(S),
	name(A, S).

le_str(String):-
	get0(Char),
	le_str_aux(Char, String).

le_str_aux(-1, []):-!.
le_str_aux(10, []):-!.
le_str_aux(13, []):-!.
le_str_aux(Char, [Char|Resto]):-
	le_str(Resto).

verifica(1):-
    nl,
    listing(telefone/2).

verifica(2):-
    nl, write('Ha '),
    findall(_,telefone(_,_),L),
    tamanho(L,X),
    write(X),write(' usuarios cadastrados'),nl,nl.

verifica(3):-
    write('Nome do usuário:'),nl,
    le_atomo(X),
    write('Número do usuário:'),nl,
    verifica_digitos(X).

verifica(4):-
    write('Nome do usuário:'),nl,
    le_atomo(X),
    retractall(telefone(X,_)),
    tell('telefone.pl'),
    listing(telefone/2),
    told.

verifica_digitos(X):-
    le_str(Y),
    tamanho(Y,Z),
    ((Z=8,
    name(Y1,Y),
    assertz(telefone(X,Y1)),
    tell('telefone.pl'),
    listing(telefone/2),
    told);
    (write('Apenas 8 digitos'),
    nl)).

tamanho([],0):-!.
tamanho([_|Y],R):-
    tamanho(Y,R1),
    R is R1+1.

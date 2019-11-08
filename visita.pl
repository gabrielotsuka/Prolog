%Fatos

%Telefone
telefone(maria,123).
telefone(joaquim,234).
telefone(marco,345).
telefone(pedro,456).
telefone(ana,567).
telefone(juliana,678).

%visita
visita(juliana,maria).
visita(ana,joaquim).
visita(marco,juliana).
visita(pedro,juliana).
visita(joaquim,juliana).

%emCasa
emCasa(joaquim).
emCasa(maria).


%Regras

acompanhada(X):-
    visita(_,X).

inconsistente :-
    emCasa(X),
    visita(X,_).

em_casa_de(X,Y) :-
    visita(X,Y).
em_casa_de(X,Y):-
    visita(X,Z),
    em_casa_de(Z,Y).


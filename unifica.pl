sobremesa(sorvete).
sobremesa(frutas).
carne(bife).
carne(cupim).
peixe(dourado).
peixe(pintado).
aves(frango).
aves(perdiz).
entrada(sopa).
entrada(salada).

prato_principal(P):-
    peixe(P).
prato_principal(P):-
    carne(P).
prato_principal(P):-
    aves(P).
refeicao(Ent,Prin,Sobr):-
    entrada(Ent),
    prato_principal(Prin),
    sobremesa(Sobr).


nome(rufus).
nome(branca).
nome(odin).
nome(alyssa).
nome(chewie).

porte(rufus,grande).
porte(branca,pequeno).
porte(odin,medio).
porte(alyssa,grande).
porte(chewie,medio).

comp(rufus,agressivo).
comp(branca,calmo).
comp(odin,calmo).
comp(alyssa,calmo).
comp(chewie,instavel).

raca(rufus,pastor).
raca(branca,poodle).
raca(odin,buldogue).
raca(alyssa,golden).
raca(chewie,chow-chow).

sexo(rufus,masculino).
sexo(branca,feminino).
sexo(odin,masculino).
sexo(alyssa,feminino).
sexo(chewie,masculino).

cor(rufus,marrom).
cor(branca,branco).
cor(odin,fulvo).
cor(alyssa,dourado).
cor(chewie,creme).

peso(rufus,32).
peso(branca,15).
peso(odin,23).
peso(alyssa,27).
peso(chewie,29).

qnt_aliment(rufus,elevada).
qnt_aliment(odin,mediana).
qnt_aliment(branca,baixa).
qnt_aliment(alyssa,elevada).
qnt_aliment(chewie,mediana).

pelo(rufus,longo).
pelo(branca,curto).
pelo(odin,curto).
pelo(alyssa,longo).
pelo(chewie,medio).

habitacao(X,apartamento):-
    porte(X,pequeno);
    comp(X,calmo).

gastos(X,altos):-
    porte(X,grande);
    comp(X,agressivo);
    qnt_aliment(X,elevada).

gastos(X,baixos):-
    porte(X,pequeno);
    comp(X,calmo);
    qnt_aliment(X,baixa).

gastos(X,medianos):-
    porte(X,medio);
    comp(X,instavel);
    qnt_aliment(X,mediana).

cao(X,Y,Z,W,E,A,B,C,D):-
	nome(X),
	comp(X,Y),
	sexo(X,Z),
	cor(X,W),
	pelo(X,E),
	raca(X,A),
	porte(X,B),
	peso(X,C),
	qnt_aliment(X,D),
	nl,nl.

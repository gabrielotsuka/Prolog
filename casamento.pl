nome(rodigui).
nome(corote).
nome(lorena).
nome(pedrao).
nome(bea).
nome(ninguem).

sexo(rodigui,masc).
sexo(corote,masc).
sexo(pedrao,masc).
sexo(lorena,fem).
sexo(bea,fem).
sexo(ninguem,fem).

cel(rodigui,123).
cel(corote,456).
cel(pedrao,789).
cel(lorena,101).
cel(bea,112).
cel(ninguem,131).

idade(rodigui,89).
idade(corote,17).
idade(lorena,17).
idade(pedrao,25).
idade(bea,26).
idade(ninguem,88).

olhos(rodigui,castanho).
olhos(corote,azul).
olhos(lorena,castanho).
olhos(pedrao,castanho).
olhos(bea,verde).
olhos(ninguem,azul).

pele(rodigui,branca).
pele(corote,azul).
pele(pedrao,cor_do_pecado).
pele(lorena,branca).
pele(bea,branca).
pele(ninguem,branca).

altura(rodigui,1.8).
altura(corote,2.0).
altura(pedrao,1.8).
altura(lorena,0.5).
altura(bea,1.6).
altura(ninguem,1.7).

peso(rodigui,70).
peso(corote,75).
peso(lorena,450).
peso(pedrao,70).
peso(bea,60).
peso(ninguem,65).

musica(rodigui,rock).
musica(corote,sertanejo).
musica(pedrao,?).
musica(lorena,sertanejo).
musica(bea,?).
musica(ninguem,rock).

esporte(rodigui,nenhum).
esporte(corote,basquete).
esporte(lorena,monstro).
esporte(pedrao,conquistar_bea).
esporte(bea,conquistar_pedrao).
esporte(ninguem,nenhum).

idade_comp(X,Y):-
    idade(X,W),
    idade(Y,Z),
    R is W-Z,
    R > -2,
    R < 2.

musica_comp(X,Y):-
    musica(X,Z),
    musica(Y,Z).

sexo_comp(X,Y):-
    sexo(X,Z),
    sexo(Y,W),
    Z \== W.

compativel(X,Y):-
    X\==Y,
    idade_comp(X,Y),
    musica_comp(X,Y),
    sexo_comp(X,Y),
    nl.

pessoa(Nome,Sexo,Cel,Idade,Olhos,Pele,Altura,Peso,Musica,Esporte):-
    nome(Nome),
    sexo(Nome,Sexo),
    cel(Nome,Cel),
    idade(Nome,Idade),
    olhos(Nome,Olhos),
    pele(Nome,Pele),
    altura(Nome,Altura),
    peso(Nome,Peso),
    musica(Nome,Musica),
    esporte(Nome,Esporte),
    nl.




















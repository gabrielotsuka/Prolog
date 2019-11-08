sobre(e,d).
sobre(d,c).
sobre(c,b).
sobre(b,a).
sobre(a,obj).

acima_de(X,Y) :-
    sobre(X,Y).
acima_de(X,Y):-
    sobre(X,Z),
    acima_de(Z,Y).

acima_di(X,Y,1) :-
    sobre(X,Y).
acima_di(X,Y,C) :-
    sobre(X,Z),
    acima_di(Z,Y,C1),
    C is C1+1.


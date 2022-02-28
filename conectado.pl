arco(1,2).
arco(1,4).
arco(1,3).
arco(2,3).
arco(2,5).
arco(3,4).
arco(3,5).
arco(4,5).

caminho(A,B,Cam) :-
    trajetoria(A,B,[A],Q),
    reverse(Q,Cam).

trajetoria(A,B,P,[B|P]) :-
    conectado(A,B).
    
trajetoria(A,B,Visitados,Cam_inv) :-
    conectado(A,C),
    \+member(C,Visitados),
    trajetoria(C,B,[C|Visitados],Cam_inv).

conectado(A,B) :-
    arco(A,B);
    arco(B,A), !.
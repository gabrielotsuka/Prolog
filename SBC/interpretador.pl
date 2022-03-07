:- op( 800, fx, se).
:- op( 700, xfx, entao).
:- op( 300, xfy, ou).
:- op( 200, xfy, e).

certeza( P, Cert) :- fornecido( P: Cert).

certeza( P, Cert) :-
    se Cond entao P : C1,
    certeza( Cond, C2),
    Cert is C1 * C2.

certeza( Cond1 e Cond2, Cert) :-
    certeza( Cond1, Cert1),
    certeza( Cond2, Cert2),
    Cert is min( Cert1, Cert2).

certeza( Cond1 ou Cond2, Cert) :-
    certeza( Cond1, Cert1),
    certeza( Cond2, Cert2),
    Cert is max( Cert1, Cert2).

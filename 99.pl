my_last(X,[X]):-!.
my_last(R,[_|Y]):-
    my_last(R,Y).

last_bo(X,[X,_]):-!.
last_bo(R,[_|Y]):-
    last_bo(R,Y).

element_at(X,[X|_],1):-!.
element_at(R,[_|Y],C):-
    C1 is C-1,
    element_at(R,Y,C1).

n_of_elements(0,[]).
n_of_elements(R,[_|Y]):-
    n_of_elements(R1,Y),
    R is R1+1.

reverse([],[]).
reverse(R,[X|Y]):-
    reverse(R1,Y),
    append(R1,[X],R).

concat([],L,L):-!.
concat([X|Y],L,[X|R1]):-
    concat(Y,L,R1).

palindrome(Lista):-
    reverse(Lista,Lista).

my_flatten([H],X):-
    is_list(H),
    my_flatten(H,X),!.
my_flatten([H],[H]):-!.
my_flatten([H|T],X):-
    is_list(H),
    my_flatten(H,Y),
    my_flatten(T,Z),
    append(Y,Z,X),!.
my_flatten([H|T],[H|X]):-
    my_flatten(T,X),!.

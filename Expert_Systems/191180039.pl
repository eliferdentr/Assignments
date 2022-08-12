%191180039 - Elif ERDEN
:- discontiguous god/1.
:- discontiguous goddess/1.

%question -1
god(kronos).
goddess(rhea).
goddess(demeter).
god(zeus).
goddess(hera).
god(poseidon).
god(hades).
goddess(hestia).
goddess(persephone).
god(ares).
goddess(eileithyia).
goddess(hebe).
goddess(athena).
goddess(aphrodite).
god(apollo).
goddess(artemis).
god(hermes).
god(dionysus).

%question -2
% kid, parent
parent(hades,kronos).
parent(hades,rhea).

parent(hestia,kronos).
parent(hestia,rhea).

parent(poseidon,kronos).
parent(poseidon,rhea).

parent(hera,kronos).
parent(hera,rhea).

parent(zeus,kronos).
parent(zeus,rhea).

parent(demeter,kronos).
parent(demeter,rhea).

parent(persephone,demeter).
parent(persephone,zeus).
parent(ares,zeus).
parent(ares,hera).
parent(eileithyia,zeus).
parent(eileithyia,hera).
parent(hebe,zeus).
parent(hebe,hera).
parent(athena,zeus).
parent(aphrodite,zeus).
parent(apollo,zeus).
parent(artemis,zeus).
parent(hermes,zeus).
parent(dionysus,zeus).

%question -3
% mother(child,mother)
mother(X,Y):- parent(X,Y), goddess(Y).

%question -4
father(X,Y):- parent(X,Y), god(Y).

%question -5
%son(son,father)
son(X,Y):- parent(X,Y), god(X).

%question -6
daughter(X,Y):- parent(X,Y), goddess(X).

%question -7
siblings(X,Y) :- parent(X,Z), parent(Y,Z).

%question -8
sister(X,Y) :- siblings(X,Y), goddess(X).

%question -9
brother(X, Y) :- siblings(X, Y), god(X).


%question -10
/* 
% ancestor(X,Y) :- parent(X, Y).
% ancestor(X,Y) :- parent(X, A), parent(A, Y).
% ancestor(X,Y) :- parent(X, A), parent(A, B), parent(B, Y).
% ancestor(X,Y) :- parent(X, A), parent(A, B), parent(B, C), parent(C,Y).*/

%question -11
 ancestor(X, Y) :- parent(X, Y).
 ancestor(X, Y) :- parent(X, A), ancestor(A, Y).

%question -12
/*parent(X, zeus)

ANSWER:
X = persephone
X = ares
X = eileithyia
X = hebe
X = athena
X = aphrodite
X = apollo
X = artemis
X = hermes
X = dionysus */

%question -13
/*
findall(X,parent(X,zeus),Z),
findall(X,parent(X,kronos),K),
findall(X,parent(X,rhea),R),
findall(X,parent(X,demeter),D),
findall(X,parent(X,hera),H),
length(Z,Z1),
length(K,K1),
length(R,R1),
length(D,D1),
length(H,H1)

ANSWER:
D = [persephone],
D1 = 1,
H = [ares, eileithyia, hebe],
H1 = 3,
K = R, R = [hades, hestia, poseidon, hera, zeus, demeter],
K1 = R1, R1 = 6,
Z = [persephone, ares, eileithyia, hebe, athena, aphrodite, apollo, artemis, hermes, dionysus],
Z1 = 10
*/

%question -14
/* 
ancestor(athena,Y) 
 
ANSWER:
Y = zeus
Y = kronos
Y = rhea
*/

%question -15
/* 
siblings(artemis,apollo)
 
ANSWER:
true
*/

%question -16
/* 
siblings(ares,dionysus)
 
ANSWER:
true
*/

%question -17
/* 
ancestor(hebe,Y)
 
ANSWER:
Y = zeus
Y = hera
Y = kronos
Y = rhea
Y = kronos
Y = rhea
*/

%question -18
/* 
sister(poseidon,hades)
 
ANSWER:
false
*/

%question -19
/* 
mother(persophone,hera)
 
ANSWER:
false
*/

%question -20
/* 
sister(X,hermes)
 
ANSWER:
X = persephone
X = eileithyia
X = hebe
X = athena
X = aphrodite
X = artemis
*/




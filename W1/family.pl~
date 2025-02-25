/* FACTS */
parents(david, george, noreen).
parents(jennifer, george, noreen).
parents(georgejr, george, noreen).
parents(scott, george, noreen).
parents(joanne, george, noreen).
parents(jessica, david, edel).
parents(clara, david, edel).
parents(clara, david, edel).
parents(michael, david, edel).
parents(laura, georgejr, susan).
parents(anna, scott, siobhan).

/* Relationships */
father(X, Y) :- parents(Y, X, _).
male(X) :- father(X, _).

mother(X, Y) :- parents(Y, _, X).
female(X) :- mother(X, _).

grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).

grandmother(X, Y) :- mother(X, Z), mother(Z, Y).
grandmother(X, Y) :- mother(X, Z), father(Z, Y).

brother(X, Y) :- male(X), father(Z, X), father(Z, Y).

sister(X, Y) :- female(X), father(Z, X), father(Z, Y).

uncle(X, Y) :- male(X), father(Y, Z), brother(Z, X).
uncle(X, Y) :- male(X), mother(Y, Z), brother(Z, X).

aunt(X, Y) :- female(X), father(Y, Z), sister(Z, X).
aunt(X, Y) :- female(X), mother(Y, Z), sister(Z, X).

cousin(X, Y) :- mother(X, Z), aunt(Z, Y).
cousin(X, Y) :- father(X, Z), uncle(Z, Y).

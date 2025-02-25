/* FACTS */

alphabet([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]).
revalphabet([z, y, x, w, v, u, t, s, r, q, p, o, n, m, l, k, j, i, h, g, f, e, d, c, b, a]).

/* RELATIONS */

myElem(X, [X | _]).
myElem(X, [_ | T]) :- myElem(X, T).

myHead(X, [X | _]).

myLast(X, [X | [ ]]).
myLast(X, [_ | T]) :- myLast(X, T).

myTail(A, [_ | A]).

myAppend([ ], RL, RL).
myAppend([H | T1], L2, [H | T3]) :- myAppend(T1, L2, T3).

myReverse([ ], [ ]).
myReverse([X | T], Y) :- myReverse(T, T1), myAppend(T1, [X], Y).

myDelete(X, [X | T], T).
myDelete(X, [H | T], [H | L]) :- myDelete(X, T, L).

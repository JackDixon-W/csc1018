checkClass(X, Y) :- X > 0, Y = "positive", !.
checkClass(X, Y) :- X < 0, Y = "negative".

isElement(X, [X | _]).
isElement(X, [_ | T]) :- isElement(X, T).

split([ ], _, _).
split([H | T], PN, NN) :- checkClass(H, Y), Y = "positive", isElement(H, PN),
    !,
    split(T, PN, NN).
split([H | T], PN, NN) :- checkClass(H, Y), Y = "negative", isElement(H, NN),
    !,
    split(T, PN, NN).

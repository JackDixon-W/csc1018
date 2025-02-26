class(X, Y) :- X =:= 0, Y = "zero", !.
class(X, Y) :- X > 0, Y = "positive", !.
class(X, Y) :- X < 0, Y = "negative", !.

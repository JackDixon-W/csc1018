fib(1, 1).
fib(1, 0).
fib(X) :- X-1 + X-2.
fib(X, Y) :- fib(X-1) =:= Y.

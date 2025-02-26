fib(1, 1).
fib(0, 1).
fib(X, Y) :- X > 1, N1 is X - 1, N2 is X - 2, fib(N1, R1), fib(N2, R2),
    Y is R1 + R2.

/* FACTS */
direct_north(a, f).
direct_north(f, k).
direct_north(k, p).
direct_north(b, g).
direct_north(g, l).
direct_north(l, q).
direct_north(c, h).
direct_north(h, m).
direct_north(m, r).
direct_north(e, j).
direct_north(j, o).
direct_north(o, t).

direct_west(a, b).
direct_west(b, c).
direct_west(c, d).
direct_west(d, e).
direct_west(f, g).
direct_west(g, h).
direct_west(i, j).
direct_west(k, l).
direct_west(l, m).
direct_west(m, n).
direct_west(n, o).
direct_west(p, q).
direct_west(q, r).
direct_west(r, s).
direct_west(s, t).

/* RELATIONSHIPS */
direct_south(A, B) :- direct_north(B, A).
direct_east(A, B) :- direct_west(B, A).

north(X, Y) :- direct_north(X, Y).
north(X, Y) :- direct_north(X, Z), north(Z, Y).

south(X, Y) :- direct_south(X, Y).
south(X, Y) :- direct_south(X, Z), south(Z, Y).

west(X, Y) :- direct_west(X, Y).
west(X, Y) :- direct_west(X, Z), west(Z, Y).

east(X, Y) :- direct_east(X, Y).
east(X, Y) :- direct_east(X, Z), east(Z, Y).

north_east(X, Y) :- north(X, Z), east(Z, Y).
north_west(X, Y) :- north(X, Z), west(Z, Y).
south_east(X, Y) :- south(X, Z), east(Z, Y).
south_west(X, Y) :- south(X, Z), west(Z, Y).


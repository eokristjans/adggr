# netið: 
param m default 26; # must be even, hæð
param n default 39; # breidd
set X := {0..n};
set Y := {0..m};
set NODES := X cross Y; # A lattice of Nodes
# og svo stangirnar (ARCS):
param gcd {x in -n..n, y in -n..n} :=
(if x < 0 then gcd[-x,y] else
(if x == 0 then y else
(if y < x then gcd[y,x] else
(gcd[y mod x, x])
)
)
);
set ARCS := { (xi,yi) in NODES, (xj,yj) in NODES:
abs( xj-xi ) <= 3 && abs(yj-yi) <=3 && abs(gcd[ xj-xi, yj-yi ]) == 1 &&
( xi > xj || (xi == xj && yi > yj) )
};

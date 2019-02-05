# Röðin sem við skráum upplýsingar. Búið að gera tubular.dat
# Þetta á að vera lesanlegt beint úr uppsetningu verkefnis 
# eins og á bls 153-154 fyrir þetta verkefni

# 1. Gögn
set P;
set M;

param cost{P,M} default 1000000;	# Fall af P og M
# getum gert svona, og sett skorður, en þær eru spuni
# param cost{p in P, m in M: p <> 2};
param hours{P,M} default 1000000;	
# default gildi
# Nema annað sé gefið, þá verður þetta gildið. 
# Þetta gerum við því sumstaðar má ekki framleiða ákveðnar vörur.
# Einnig hægt að plokka þær út með skilyrðum.
param demand{P}; # Getum sett >=0
param capacity{M};

# 2. Breytur
var x{P,M} >= 0;

# 3. Skorður
# s.t.	Nafn	
s.t. 	DemandConstr{p in P}: sum{m in M} x[p,m] >= demand[p];
s.t.	CapacityConstr{m in M}: sum{p in P} hours[p,m]*x[p,m] <= capacity[m];

# 4. Markfall
minimize totalcost: sum{p in P, m in M} x[p,m]*cost[p,m];
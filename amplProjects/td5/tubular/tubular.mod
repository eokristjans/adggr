# R��in sem vi� skr�um uppl�singar. B�i� a� gera tubular.dat
# �etta � a� vera lesanlegt beint �r uppsetningu verkefnis 
# eins og � bls 153-154 fyrir �etta verkefni

# 1. G�gn
set P;
set M;

param cost{P,M} default 1000000;	# Fall af P og M
# getum gert svona, og sett skor�ur, en ��r eru spuni
# param cost{p in P, m in M: p <> 2};
param hours{P,M} default 1000000;	
# default gildi
# Nema anna� s� gefi�, �� ver�ur �etta gildi�. 
# �etta gerum vi� �v� sumsta�ar m� ekki framlei�a �kve�nar v�rur.
# Einnig h�gt a� plokka ��r �t me� skilyr�um.
param demand{P}; # Getum sett >=0
param capacity{M};

# 2. Breytur
var x{P,M} >= 0;

# 3. Skor�ur
# s.t.	Nafn	
s.t. 	DemandConstr{p in P}: sum{m in M} x[p,m] >= demand[p];
s.t.	CapacityConstr{m in M}: sum{p in P} hours[p,m]*x[p,m] <= capacity[m];

# 4. Markfall
minimize totalcost: sum{p in P, m in M} x[p,m]*cost[p,m];
# 1.) Gogn
set P;
set M;
set PM within P cross M;

param cost{P,M};
param hours{P,M};
param demand{P};
param capacity{M};

# 2.) Breytur
var x{PM} >= 0;

# 3.) Skordur
subject to DemandConst{p in P}: sum{m in M: (p,m) in PM} x[p,m] >= demand[p];
subject to CapacityConst{m in M}: sum{p in P: (p,m) in PM} hours[p,m]*x[p,m] <= capacity[m];

# 4.) Markfall
minimize totalcost: sum{(p,m) in PM} x[p,m] * cost[p,m];

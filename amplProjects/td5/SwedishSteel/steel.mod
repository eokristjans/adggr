# 1. Gogn
set I;
set M;

param available{I};
param cost{I};
param composition{I,M};
param minBlend{M};
param maxBlend{M};

# 2. Breytur
var x{I} >= 0;

# 3. Skordur
s.t. WeightConstr:           sum{i in I} x[i] = 1000;
s.t. minBlendConstr{m in M}: sum{i in I} x[i]*composition[i,m] >= minBlend[m]*1000;   # 1 er dálkur carbon í töflu
s.t. maxBlendConstr{m in M}: sum{i in I} x[i]*composition[i,m] <= maxBlend[m]*1000;   # 1 er dálkur carbon í töflu
s.t. scrap1Constr:           x[1] <= available[1];
s.t. scrap2Constr:           x[2] <= available[2];

# 4. Markfall
minimize    totalcost:  sum{i in I} x[i]*cost[i];
# 1. Gogn
set I;
set M;

param available{I} >=0;
param cost{I} >=0;
param composition{I,M} >=0;
param minBlend{M} >=0;
param maxBlend{M} >=0;

# 2. Breytur
var x{I} >= 0;

# 3. Skordur
s.t. WeightConstr:           sum{i in I} x[i] = 1000;
s.t. minBlendConstr{m in M}: sum{i in I} x[i]*composition[i,m] >= 1000*minBlend[m];   # 1 er dálkur carbon í töflu
s.t. maxBlendConstr{m in M}: sum{i in I} x[i]*composition[i,m] <= 1000*maxBlend[m];   # 1 er dálkur carbon í töflu
s.t. scrap1Constr:           x[1] <= available[1];
s.t. scrap2Constr:           x[2] <= available[2];

# 4. Markfall
minimize    totalcost:  sum{i in I} x[i]*cost[i];
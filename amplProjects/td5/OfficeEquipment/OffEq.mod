set Model;

param mats{Model};
param profit{Model};
param time{Model};

var x{Model+Pieces} >= 0;

s.t. matsConstr: sum{m in Model} x[m]*mats[m] <= 500;
s.t. timeConstr: sum{m in Model} x[m]*time[m] <= 80;

maximize totalProfit: sum{m in Model} x[m]*profit[m];
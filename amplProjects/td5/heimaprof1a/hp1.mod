set Stadir;

param kostnadur{Stadir};
param ysa{Stadir};
param thorskur{Stadir};
param karfi{Stadir};

var x{Stadir} >= 0;

s.t.    ysaConstr:  sum{s in Stadir} ysa[s]*x[s] >= 25;
s.t.    thorskurConstr:  sum{s in Stadir} thorskur[s]*x[s] >= 14;
s.t.    karfiConstr:  sum{s in Stadir} karfi[s]*x[s] >= 11;

minimize samtalsKostnadur: sum{s in Stadir} kostnadur[s]*x[s];
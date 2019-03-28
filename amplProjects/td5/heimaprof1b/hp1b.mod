set Togari;
set Verksmidja;

param verd{Togari};
param frambod{Togari};
param flkostn{Togari,Verksmidja};
param magn{Verksmidja};
param laun{Verksmidja};
param soluverd{Verksmidja};

var x{Togari,Verksmidja} >= 0;

s.t. frambodConstr{t in Togari}: sum{v in Verksmidja} x[t,v] <= frambod[t];
s.t. magnConstr{v in Verksmidja}: sum{t in Togari} x[t,v] <= magn[v];

maximize hagnadur: sum{t in Togari, v in Verksmidja} (x[t,v]*soluverd[v] - x[t,v]*laun[v] - x[t,v]*flkostn[t,v] - x[t,v]*verd[t]);
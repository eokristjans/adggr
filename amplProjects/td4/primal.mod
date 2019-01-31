set vorur;  # vorur sem er verid ad framleida
set hraefni; # hraefni sem tharf i framleidslu

param lager{hraefni};
param uppskrift{vorur,hraefni};
param verd{vorur};
var x{vorur} >= 0;
maximize hagnadur: 
    sum{v in vorur} verd[v]*x[v];
subject to takmarkadHraefni{h in hraefni}: 
    sum{v in vorur} x[v]*uppskrift[v,h] <= lager[h];
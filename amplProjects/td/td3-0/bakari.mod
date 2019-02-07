set vorur; # vorur sem verid er ad framleida
set hraefni; # hraefni sem tharf i framleidslu

param lager{hraefni};
param uppskrift{vorur,hraefni};
param verd{vorur};
var x{vorur} >= 0;
maximize hagnadur: sum{v in vorur} verd[v]*x[v];
subject to takmarkadhraefni{h in hraefni}:
sum{v in vorur} x[v]*uppskrift[v,h] <= lager[h];


# console: model bakari.mod;
# nu er model komid i minni, ohad gagnasetti/fyrirtaeki
# console: data bakari.dat;
# console: option solver gurobi;
# console: solve;
# display x;

# hafa current directory rett
# gerir allt ad ofan:
# include bakari.run

set I; # Eignir
set J; # Kunnar
set S;
set K; 
set JS within J cross S;
set IS within I cross S;


param fjarmagn; # Fje til umrada

param ci{I}; # nuvirdi eignar
param mi{I}; # staerd eignar
param gi{I}; # gaedi eignar
param cj{J}; # greidslugeta kunna
param mj{J}; # staerdarkrafa kunna
param gj{J}; # gaedakrafa kunna

param si{I,S} binary; # stadsetning eignar
param sj{J,S} binary; # stadsetningarkrafa kunna

# param Ar{J}; # Arbaer
# param Mi{J}; # Midbaer
# param Ko{J}; # Kopavogur
# param Hf{J}; # Hafnarfjordur
# param LV{J}; # Laugar..Vogar
# param Ge{J}; # Gerdi
# param Br{J}; # Breidholt
# param Gv{J}; # Grafarvogur
# param Ve{J}; # Vesturvaer
# param Se{J}; # Seltjarnarnes
# param Ha{J}; # Haaleiti
# param Hl{J}; # Hlidar
# param Fo{J}; # Fossvogur
# param Ga{J}; # Gardabaer
# param Mo{J}; # Mosfellsbaer
# param Gh{J}; # Grafarholt


# purchase property i (binary decision)
var x{I} binary;
# customer j wants to rent property i (binary decision)
# but he can only rent what has been bought, and then only once,
# notice that when x[i] = 0, then for all j, z[i,j] = 0
var z{I,J} binary;

maximize  # sum{i in I, j in J} ci[i] * x[i] * z[i,j];
markfall: sum{i in I, j in J} ci[i] * z[i,j];

s.t. fjarmagn_constr: sum{i in I} ci[i] * x[i] <= fjarmagn;


s.t. eign_keypt_constr{i in I}: x[i] >= sum{j in J} z[i,j];
# now use this variable z to add all other constraints for customer j
# this will force z[i,j] to be zero if the quality is too low
s.t. gaedi_constr{j in J}: sum{i in I: gi[i] < gj[j]} z[i,j] = 0;
# this will force z[i,j] to be zero 
# if 0.5% of the price of the apartment is more than customer's credit
s.t. verd_constr{j in J}: sum{i in I: 0.005*ci[i] > cj[j]} z[i,j] = 0;
# this will force z[i,j] to be zero if the size is too small
s.t. staerd_constr{j in J}: sum{i in I: mi[i] > mj[j]} z[i,j] = 0;
# s.t. svaedi_constr{i in I, s in S}: sum{(j,s) in JS: sj[j,s] * si[i,s] == 0} z[i,j] = 0;

# svaedi_constr: fyrir hvert i, ef ekkert si = sj �� er z = 0

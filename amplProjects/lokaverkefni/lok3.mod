
set I; # Eignir
set J; # Kunnar
set S;
set K; 
set JS within J cross S;
set IS within I cross S;

param si{I,S} binary; # stadsetning eignar
param sj{J,S} binary; # stadsetningarkrafa kunna

param fjarmagn; # Fjarmagn til umrada
param factor; # 1000 * ROI / 12

param ci{I}; # nuvirdi eignar
param mi{I}; # staerd eignar
param gi{I}; # gaedi eignar
param cj{J}; # greidslugeta kunna
param mj{J}; # staerdarkrafa kunna
param gj{J}; # gaedakrafa kunna

# purchase property i (binary decision)
var x{I} binary;

set IJ := setof{i in I, j in J: 
					mi[i] >= mj[j] 
				and gi[i] >= gj[j] 
				and factor*ci[i] <= cj[j] } (i,j) ;

# customer j wants to rent property i (binary decision)
# but he can only rent what has been bought, and then only once,
# notice that when x[i] = 0, then for all j, z[i,j] = 0
# var z{I,J} binary;
var z{IJ} binary;


maximize  # sum{i in I, j in J} ci[i] * x[i] * z[i,j];
markfall: sum{(i,j) in IJ} ci[i] * z[i,j] * factor; # 0.005 * 1000

s.t. fjarmagn_constr: sum{i in I} ci[i] * x[i] <= fjarmagn;

s.t. eign_keypt_constr{i in I}: x[i] >= sum{(i,j) in IJ} z[i,j]; # >=
s.t. ein_eign_per_kunni{j in J}: sum{(i,j) in IJ} z[i,j]<=1;

# now use this variable z to add all other constraints for customer j
# this will force z[i,j] to be zero if the quality is too low
# s.t. gaedi_constr{(i,j) in IJ}:  z[i,j]*gi[i] >= z[i,j]*gj[j];

# this will force z[i,j] to be zero 
# if 0.5% of the price of the apartment is more than customer's credit
# s.t. verd_constr{(i,j) in IJ}: z[i,j]*cj[j] >= factor*z[i,j]*ci[i]; # 0.005 * 1000

# this will force z[i,j] to be zero if the size is too small
# s.t. staeard_constr{(i,j) in IJ}:  z[i,j]*mi[i] >= z[i,j]*mj[j];


s.t. svaedi_constr{(i,j) in IJ, s in S}: z[i,j]*si[i,s] <= z[i,j]*sj[j,s];

# put z[i,j] instead of x[i] because this specific customer needs to fulfill the requirements

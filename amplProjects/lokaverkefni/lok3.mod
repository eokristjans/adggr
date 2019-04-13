
set I; # Eignir
set J; # Kunnar
set S;
set JS within J cross S;
set IS within I cross S;
set Y;

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

# Kaupa eign i, tviundarakvordun
var x{I} binary;

# Skoda einungis ad leigja eign i til kunna j ef skilyrdi eru uppfyllt
set IJ := setof{i in I, j in J: 
					mi[i] >= mj[j] 
				and gi[i] >= gj[j] 
				and 5*ci[i] <= cj[j] } (i,j) ;

# Leigja eign i til kunna j, tviundarakvordun
var z{IJ} binary;

# Hamarka leigutekjur
maximize markfall: sum{(i,j) in IJ} (factor * ci[i] * z[i,j]); # * factor  - 200000*z[i,j]

# Keyptar eignir ekki meira en fjarmagn til umrada
s.t. fjarmagn_constr: sum{i in I} ci[i] * x[i] <= fjarmagn;

# Einungis keyptar eignir eru leigdar ut
s.t. eign_keypt_constr{i in I}: x[i] >= sum{(i,j) in IJ} z[i,j];

# Hver kunni leigir einungis eina eign
s.t. ein_eign_per_kunni{j in J}: sum{(i,j) in IJ} z[i,j]<=1;

# Eign i einungis leigd til kunna j ef hann vill bua a thvi matssvaedi
s.t. svaedi_constr{(i,j) in IJ, s in S}: z[i,j]*si[i,s] <= z[i,j]*sj[j,s];

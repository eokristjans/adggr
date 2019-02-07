set Kjottegundir;       # set of subjects

# input parameters
param Kcal {k in Kjottegundir}      >= 0;
param Fat {k in Kjottegundir}       >= 0;
param Sodium {k in Kjottegundir}    >= 0;

# decision variables
var x {k in Kjottegundir} >= 0;

# objective functions
maximize Beef:  x['B'];

# constraints
s.t.    Kjotmagn:       sum {k in Kjottegundir} x[k] >= 125;
s.t.    Hitaeiningar:
            sum {k in Kjottegundir} x[k] * Kcal[k] <= 350;
s.t.    Fita:
            sum {k in Kjottegundir} x[k] * Fat[k] <= 15;
s.t.    Salt:
            sum {k in Kjottegundir} x[k] * Sodium[k] <= 360;

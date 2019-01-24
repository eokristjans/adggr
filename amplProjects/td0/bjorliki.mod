set Afengi;     # set of subjects

param Styrkur {j in Afengi};    # input parameter 1
param Kostn {j in Afengi};      # input parameter 2

# ratio of each type of alcohol to use
var x {j in Afengi} >= 0;       # decision variables

# Objective functions
maximize Strength:  sum {a in Afengi} Styrkur[a] * x[a];
minimize Kostnadur: sum {a in Afengi} Kostn[a] * x[a];

# Constraints:
s.t.    Hlutfall:   sum {a in Afengi} x[a] = 1;     # Sum of ratios is 1
s.t.    vodka:      x['V'] <= 7/100;
s.t.    brandi:     x['B'] >= 2/100;
s.t.    malt:       3/100 <= x['M'] <= 5/100;
s.t.    sterkt:     x['V'] + x['B'] <= 0.1;
s.t.    minStyrkur: sum{a in Afengi} x[a] * Styrkur[a] >= 4;



#haegt ad gera... sum{i in I : i <> 10} x[i];
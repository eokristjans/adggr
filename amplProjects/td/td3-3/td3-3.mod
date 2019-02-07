# sets that we defined in the .dat file
set Patterns    := {1..6};
set Spytur;

# input parameters
param Demand{Spytur};
param cutPatterns{Patterns,Spytur};

# decision variables
var x{Patterns}, integer; 

# objective function
minimize numSpytur:    sum {p in Patterns} x[p];

# constraints
s.t.    spytuDemand {s in Spytur}:          sum{p in Patterns}  cutPatterns[p,s]*x[p] >= Demand[s];
s.t.    positiveIntegers {p in Patterns}:   x[p] >= 0;
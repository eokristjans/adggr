# set of...
set Wires;

#input parameters
param C {w in Wires};   # Cost
param R {w in Wires};   # Resistance
param A {w in Wires};   # Attenuation

# decision variables
var x {w in Wires} >= 0;    # Types of wires (by diameter)

# Objective function
minimize Cost:   sum {w in Wires} C[w] * x[w];

# Constraints
s.t.    Length:         sum {w in Wires} x[w] >= 16000;
s.t.    Resistance:     sum {w in Wires} R[w] * x[w] <= 1600;
s.t.    Attenuation:    sum {w in Wires} A[w] * x[w] <= 8.5;
set styrkur;
set hraefni;
var hlutfall {hraefni};

maximize styrkur: 
subject to 
vodka:      hlutfall['V'] <= 7/100;
brandi:     hlutfall['B'] >= 7/100;
malt:       hlutfall['M'] <= 5/100;
malt:       hlutfall['M'] >= 3/100;
sterkt:     hlutfall['V']+hlutfall['B'] <= 10/100;
samtals:    sum{h in hlutfall} = 1;
# allir >=0

subject to vodka: hlutfall['V'] <= 7/100;
subject to vodka: hlutfall['V'] <= 7/100;


;


#haegt ad gera... sum{i in I : i <> 10} x[i];
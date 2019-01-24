# skilgreinum set (vidfangsefni bestunar,
# t.d. vorur sem a ad framleida)
set Afengi;

# param, thekktar staerdir sem velta a vidfangsefninu
# thad er hvert afengi hefur mismunandi styrk, hver vara er
# framleidd a mismunandi hrada, hver vara hefur mismunandi
# kostnad, o.s.frv.
param Styrkur {j in Afengi};
param Kostn {j in Afengi};

# akvordunarbreytur (decision variables), hvada gildi a
# ad akvarda i bestunarvandamalinu. Her, hve mikid a ad hafa
# af hverri tegund afengis
var x {j in Afengi} >= 0;

# leysum baedi daemin med sama modeli, hofum tvo markfoll
# daemi 1: hamarka styrk gods bjorlikis
maximize Strength: sum {a in Afengi} Styrkur[a] * x[a];
# daemi 2: lagmorkum kostnad med lagmarks styrk
minimize Kostnadur: sum {a in Afengi} Kostn[a] * x[a];

# skordur
subject to Hlutfall: sum {a in Afengi} x[a] = 1;
subject to M: 0.03 <= x["Malt"] <= 0.05;
subject to V: 0 <= x["Vodka"] <= 0.07;
subject to B: x["Brandy"] >= 0.02;
subject to Sterkt: x["Vodka"] + x["Brandy"] <= 0.1;
# athugid ad thar sem fyrra daemid er ad hamarka styrk
# er i lagi ad hafa naestu skordu fyrir baedi markfoll
subject to minStyrkur: sum{a in Afengi} x[a] * Styrkur[a] >= 4;

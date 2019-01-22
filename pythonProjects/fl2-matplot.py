#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 16 22:49:12 2019
Aðgerðagreining Inngangur - Fyrirlestur vika 2
Teikna lausn í Python með matplotlib
@author: erling
"""

import matplotlib.pyplot as plt

plt.rcParams.update({'font.size': 16})
# Gögn
hraefni_beyglur = [5,2,1] # hveiti, egg, sykur
hraefni_muffur = [4,4,2] # hveiti, egg, sykur
lager_hraefni = [50,30,20] # hveiti, egg, sykur
hagnadur_vorur = [10,12] # beyglur, muffur
# Teikna takmarknir (skorður):
# Sykur, egg, hveiti:
for i in range(len(lager_hraefni)):
    intercept = lager_hraefni[i]/hraefni_beyglur[i]
    slope = -hraefni_muffur[i]/hraefni_beyglur[i]
    plt.plot([0, 12],[intercept, 12*slope+intercept], 'k', linewidth = 4 )
plt.ylabel("beyglur")
plt.xlabel("múffur")
plt.axis([0, 12, 0, 22])
# besta lausn er, teiknum markfallið þar sem z = zopt:
zopt = 350/3
opt_beyglur = 20/3
opt_muffur = 25/6
intercept = zopt/hagnadur_vorur[0]
slope = -hagnadur_vorur[1]/hagnadur_vorur[0]
plt.plot([0, 12], [intercept, 12*slope + intercept],'r', linewidth = 2)
# besta lausn ()*)
plt.plot(opt_muffur,opt_beyglur,'*', markersize=22) # besta lausn
plt.grid()
plt.show()
plt.savefig('mynd.pdf')
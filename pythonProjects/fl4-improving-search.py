# -*- coding: utf-8 -*-
"""
Created on Tue Jan 29 08:36:19 2019

@author: tfrunarsson
https://github.com/tprunarsson/Adgerdagreining2019/blob/master/improving_search.ipynb
"""

import numpy as np
# location of center 1 and population
c1x = np.array([-1,3])
c1pop = 60000
# location of center 2
c2x = np.array([1,3])
c2pop = 20000
# location of center 3
c3x = np.array([0,-4])
c3pop = 30000
# The new store can be located anywhere except in the congested areas within
# 1/2 mile of each population center.
distance = lambda x, xc : np.sqrt(np.sum((x - xc)**2))


import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = [15, 10]
ax = plt.gca()
ax.cla() # clear things for fresh plot
ax.set_xlim((-9, 9))
ax.set_ylim((-9, 9))
# key data point that we are encircling
ax.plot(c1x[0], c1x[1], 'o', color = 'k')
ax.plot(c2x[0], c2x[1], 'o', color = 'k')
ax.plot(c3x[0], c3x[1], 'o', color = 'k')
circle1 = plt.Circle(c1x,1/2,color = 'r')
plt.gcf().gca().add_artist(circle1)
circle2 = plt.Circle(c2x,1/2,color = 'r')
plt.gcf().gca().add_artist(circle2)
circle3 = plt.Circle(c3x,1/2,color = 'r')
plt.gcf().gca().add_artist(circle3)
ax.set_aspect('equal', adjustable='datalim')
ax.plot()   # Causes an autoscale update.
plt.show()


objective = lambda x1,x2 : 60/(1+(x1+1)**2+(x2-3)**2)+20/(1+(x1-1)**2+(x2-3)**2)+30/(1+(x1)**2+(x2+4)**2)


# Lets draw the landscape for this objective function, and the improving search example given in the text:
x1list = np.linspace(-9.0, 9.0, 100)
x2list = np.linspace(-9.0, 9.0, 100) # Býr til grid
X1, X2 = np.meshgrid(x1list, x2list) # Svo við getum reiknað fallsgildið í þeim
F = objective(X1,X2)
levels = [3.5, 11.5, 21.6, 36, 40, 54.8, 70]
contour = plt.contour(X1, X2, F, levels, colors='k') # Jafnhæðarit (contour)
plt.clabel(contour, colors = 'k', fmt = '%2.1f', fontsize=12)
contour_filled = plt.contourf(X1, X2, F, levels)
plt.colorbar(contour_filled)
plt.title('Objective landscape')
plt.xlabel('$x_1$')
plt.ylabel('$x_2$')
x = np.array([-5,0]) # we start our initial guess here
# example steps that could be taken (don't worry about how for now)
# Hér heldur Tómas því fram að rithöfundur bókarinnar finni stefnuna með ólínulegri bestun
step = np.array([[ 2. ,  4. ],[ 2. ,  0.5], [ 1. , -1. ], [-0.5, -0.5]])
for iter in range(4):
    plt.arrow( x[0], x[1], step[iter,0], step[iter,1], fc="k", ec="k", head_width=0.5, head_length=0.1 )
    x = x + step[iter,:]
    print(x)
plt.show()


# Teiknum aðra mynd. Hér er notaður Stigullinn á jafnhæðalínurnar.
contour = plt.contour(X1, X2, F, levels, colors='k')
plt.clabel(contour, colors = 'k', fmt = '%2.1f', fontsize=12)
import sympy as sp
# sp.init_printing()    # prentar jöfnurnar á latex formi í .ipynb formati
x1, x2 = sp.symbols('x1 x2')
f = objective(x1,x2)
dfdx1=sp.diff(f,x1)
dfdx2=sp.diff(f,x2)
x = np.array([-5,0])    # upphafspunktur
lmda = .1   # stærð skrefs, upprunalega .7, en mætti minnka með ítrunum svo það hoppi ekki út úr miðju
for iter in range(30):
    dx1 = np.float(dfdx1.subs(x1,x[0]).subs(x2,x[1]).evalf())
    dx2 = np.float(dfdx2.subs(x1,x[0]).subs(x2,x[1]).evalf())
    plt.arrow( x[0], x[1], lmda*dx1, lmda*dx2, fc="k", ec="k", head_width=0.5, head_length=0.1 )
    x = x + lmda*np.array([dx1,dx2])
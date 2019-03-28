# -*- coding: utf-8 -*-
"""
Sensitivity Analysis (Næmnigreining)

@author: Erling Oskar Kristjansson
"""

import numpy as np

""" Reikna invB """
A = np.array([[1,2],[1,1],[2,1]])
b = np.array([[120],[70],[100]])
c = np.array([5,4])
AI = np.hstack((A,np.eye(3)))
basis = [0,1,2]
nonbasis = [3,4]
B = AI[:,basis]
N = AI[:,nonbasis]
invB = np.linalg.inv(B)
print(invB)
# [[ 0. -1. 1.]
# [ 0. 2. -1.]
# [ 1. -3. 1.]]
xb = invB @ b
print(xb)
# [[30.]
# [40.]
# [10.]]
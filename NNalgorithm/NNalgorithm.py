# coding: UTF-8
import numpy as np
import math

p_syouga = np.array([2, 5])
p_myouga = np.array([-1, 2])

data = np.array([1, 1])

def distance(x, y):
	return sum((x-y)**2)


if distance(p_syouga, data) > distance(p_syouga, data):
	print "syouga"
else:
	print "myouga"


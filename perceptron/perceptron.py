# coding: UTF-8
import numpy as np
import math
import sys

### 符号を調べる関数
# Rでいうsign関数が見当たらないので、とりあえず実装
def sign(x):
	if x > 0:
		return 1
	else:
		return -1

### 初期値を設定
test_data = np.array([[1, -1.3], [1, -0.2], [1, 0.5], [1, 1]])
label = np.array([-1, -1, 1, 1])
w = np.array([0.2, 0.3])
rho = 0.5

### 重みベクトルを更新する関数
def update(x, l, w):
	if (sign(np.dot(x, w)) == sign(l)):
		return w
	return w + rho * x * l

### 全データで重みベクトルが更新されなくなるまで繰り返す
count = 0 
while (count < test_data.shape[0]):
	for i in range(0, test_data.shape[0]):
		temp = update(test_data[i], label[i], w)
		if (all(temp == w)):
			count = count+1
		else:
			print("クラスを誤認識しました\n")
			print("重みベクトルを更新します\n")
			w = temp
			print(w)
			count = 0

print("識別関数は、%f x %fです" % (w[1], w[0]))
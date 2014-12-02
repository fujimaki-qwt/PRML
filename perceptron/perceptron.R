### 初期値を設定
test_data <- matrix(c(1, 1, 1, 1, -1.3, -0.2, 0.5, 1), 4, 2) # 学習データを行列で用意
label <- c(-1, -1, 1, 1) # 学習データのラベル
w <- c(0.2, 0.3) # 初期重み
rho <- 0.5 # 学習係数

### 学習データをプロット
plot(cbind(test_data[1:2, 2], rep(0, 2)), col="red",
     xlim=c(-2, 2), ylim=c(-2,2), xlab="x", ylab="y")
par(new=T)
plot(cbind(test_data[3:4, 2], rep(0, 2)), col="blue",
     xlim=c(-2, 2), ylim=c(-2,2), xlab="x", ylab="y")

### 重みベクトルを更新する関数
update <- function(x, l, w) {
  if (sign(x %*% w) == sign(l)) {
    return (w)
  }
  return (w+rho*x*l)
}

### 全データで重みベクトルが更新されなくなるまで繰り返す
count <- 0 
while (count < nrow(test_data)) {
  for (i in 1:nrow(test_data)) {
    temp <- update(test_data[i,], label[i], w)
    if (all(temp == w)) {
      count <- count+1
    } else {
      cat("クラスを誤認識しました\n")
      cat("重みベクトルを更新します\n")
      w <- temp
      print(w)
      count <- 0
    }
  }
}

### 最終的な識別関数を図示
curve(w[2]*x+w[1], -5, 5, add=T)
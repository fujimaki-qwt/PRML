p_syouga = c(2, 5)
p_myouga = c(-1, 2)
data = c(1, 1)

# ベクトルの距離を測る
sqrt(sum((p_syouga - data)^2)) # sqrt(17)と結果が一緒なのでOK
sqrt(sum((p_myouga - data)^2))

if (sqrt(sum((p_syouga - data)^2)) > sqrt(sum((p_myouga - data)^2))){
  print("みょうがです", quote=F)
} else {
  print("しょうがです", quote=F)
}

require 'bootstrap'

vector2 = require 'vector2'

D = {
  vector2(0, 0), vector2(1, 2), vector2(3, 1)
  vector2(8, 8), vector2(9, 10), vector2(10, 7)
}

kmeans = (D, k) ->
  C = {}
  u = [D[i] for i = 1, k]
  while true
    for i = 1, #D
      mind = math.huge
      minu = 0
      for j = 1, k
        d = D[i]\sqDistance(u[j])
        continue unless d < mind
        mind, minu = d, j
      C[i] = minu
    newu = [vector2.zero for _ = 1, k]
    tn = [0 for _ = 1, k]
    for i = 1, #D
      newu[C[i]] += D[i]
      tn[C[i]] += 1
    for i = 1, k do newu[i] = newu[i]/tn[i]

    ok = true
    for i = 1, k
      if newu[i] ~= u[i]
        ok = false
        break
    if ok
      return C
    else
      u = newu

C = kmeans(D, 3)
print(table.dump(C))
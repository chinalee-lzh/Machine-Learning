vector2 = require 'unity.vector2'

rotate90 = (vec) -> vector2(vec.y, -vec.x)
mid = (va, vb) -> (va+vb)/2
check = (v, circle, r) -> v\distance(circle) <= r
intersection = (p1, v1, p2, v2) ->
  f = (p2-p1)\cross(v2)/v1\cross(v2)
  p1+v1*f
circle = (va, vb, vc) -> intersection(mid(va, vb), rotate90(vb-va), mid(va, vc), rotate90(vc-va))

(dots) ->
  C = dots[1]
  R = 0
  for i = 2, #dots
    continue if check(dots[i], C, R)
    newc = dots[i]
    newr = 0
    for j = 1, i-1
      continue if check(dots[j], newc, newr)
      newc = mid(dots[i], dots[j])
      newr = dots[i]\distance(dots[j])/2
      for k = 1, j-1
        continue if check(dots[k], newc, newr)
        newc = circle(dots[i], dots[j], dots[k])
        newr = dots[i]\distance(newc)
    C = newc
    R = newr
  C, R
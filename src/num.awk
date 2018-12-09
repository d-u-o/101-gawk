#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"

function Num(i,pos,txt) {
  isa(Object(i))
  i.pos =pos
  i.txt =txt
  i.hi  = -1e32
  i.lo  =  1e32
  i.n   = i.mu = i.m2 = i.sd = 0
  i.w   = 1
  i.ignore = "?"
}
function NumAdd(i,x,          delta) {
  if (x == i.ignore) return x
  x    += 0 # coerce any strings to a number
  i.n  += 1
  i.lo  = x < i.lo ? x : i.lo
  i.hi  = x > i.hi ? x : i.hi
  delta = x - i.mu
  i.mu += delta/i.n
  i.m2 += delta*(x - i.mu)
  if (i.n > 1)
    i.sd = (i.m2/(i.n-1))^0.5
  return x
}
function NumNorm(i,x) {
  return (x- i.lo)/ (i.hi - i.lo +10^-32)
}

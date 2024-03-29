#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"

function Sym(i,pos,txt) {
  isa(Object(i))
  i.pos = pos
  i.txt = txt
  i.mode = ""
  i.most = 0
  i._ent =""
  i.n = 0
  i.ignore="?"
  i.w=1
  has(i,"counts")
}
function SymAdd(i,x,   tmp) {
  if( x == i.ignore ) return x
  i.n++
  i._ent=""
  tmp = i.counts[x] = i.counts[x] + 1
  if(tmp > i.mode) {
    i.most = tmp
    i.mode = x
  }
  return x
}
function SymNorm(i,x) { 
  return x 
}
function SymEnt(i,   x,p) {
  if (i._ent)
    return i._ent
  i._ent=0
  for(x in i.counts) {
    p       = i.counts[x]/i.n
    i._ent -= p * log(p) / log(2)
  }
  return i._ent
}

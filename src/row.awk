#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"

function Table(i) {
  has(i,"header","Row")
  has(i,"rows")
}
function Row(i) {
  isa(Object(i))
  has(i,"less")
  has(i,"more")
  has(i,"num")
  has(i,"sym") 
  i.class=""
}
function RowAdd(i,csv,cells,   pos,xy) {
  for(pos in csv.use)  {
    xy = csv.xy[pos]
    i.cells[pos] = add(csv[xy][pos], cells[pos]) }
}

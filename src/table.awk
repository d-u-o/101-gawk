# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"
@include "file"
@include "num"
@include "sym"

# ------------------------
# ## Row
function Row(i) {
  isa(Object(i))
  has(i,AU.ch.less)
  has(i,AU.ch.more)
  has(i,AU.ch.num)
  has(i,AU.ch.class)
  has(i,AU.ch.sym)
}
function RowPrint(i,      s,sep,x,y) {
  s="\n"
  for(x in i) {
    sep=""
    for(y in i[x]) {
      s = s sep i[x][y]
      sep=","}
    s = s "\n"}
  print s
}

# ------------------------
function Table(i,name) {
  isa(Object(i))
  has(i,"rows")
  has(i,"stats","Row")
  has(i,"header","Row")
  i.txt=name
}
function TableRead(i,f) {
  csv(i,f,"TableAdd","Table0","\n","")
}
# When we add a `header` to a `table`, also add objects
# to collet statistics for the `num`s and `sym`s.
function Table0(i, row, strs,   j,n,a,x,y) {
  print("t0",length(strs))
   for(j in strs) {
     print("str> ", strs[j])
     n= split(strs[j],a,",")
     x=a[1]
     print">",n,x,j
     for(y=2;y<=n;y++) {
       print("--->", x,a[y])
       i.header[x][y] =   a[y]; print 22
       i.stats[x][y] =  numcell(x) ? "Num" : "Sym"; print 33}}
  o(i); exit
}

# `numcell` is true for `num`, `less`, `more` symbols.
function numcell(x) { return x==AU.ch.num || x==AU.ch.less || x==AU.ch.more }

# When we add a `row` to a `table`, we also update the `stats`.
function TableAdd(i, row,strs,    j,n,a,x,y,cell) {
  print ""
  for(j in strs) {
    n = split(strs[j],a,",")
    x = a[1]; print("))","["strs[j]"]" ,x,n)
    for(y=2;y<=n;y++) {
      cell = numcell(x)  ? 0 + a[y] : a[y]
      print "cell " cell
      has(i.rows[row][x],y, cell)
      print 22
      Add(i.stats[x][y], cell)
}}}

# The following is a public "pretty print" of tables.
# Does not show `stats`.
function TablePrint(i,   rows,r) {
  Print(i.header)
  for(r in i.rows)
    Print(i.rows[r])
}
function _table(i,f)  {
  f="-"
  Table(i,f)
  Read(i,f)
  o(i,"t")
  rogues()
}
BEGIN { _table() }

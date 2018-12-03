#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"
@include "rows"
@include "num"
@include "sym"

function Csv(i) {
  Object(i); i._ako="Csv"
  has(i,"x")
  has(i,"y")
  has(i,"xy")
  has(i,"rows")
  has(i,"use")
  i.klassp = "[><!]"
  i.nump   = "[$<>]"
  i.skip   = "?"
}
function CsvRead(i,file,        txts,txt,cells, row) {
  while((getline txt < file) > 0)  {
     gsub(/[ \t\r]*/, "", txt) # no whitespce:
     gsub(/#["*"]$/,     "", txt) # no comments
     if (txt) {
       txts = txts txt
       if (txts !~ /,$/) {
         split(txts, cells, ",")
         txts = ""
         if (row) {
           has(i.rows, row, "Row")
           add(i.rows[row], i, cells)
         }
         else
           CsvHeader(i,cells)
         row++
  }}}
  close(file)
}
function CsvHeader(i,cells,       j,txt,pos,xy,what) {
  for(j in cells) {
    txt = cells[j]
    if (txt !~ i.skip) {
      i.use[++pos] =  j
      xy    = i.xy[pos] = (txt ~ i.klassp) ? "y"   : "x"
      what  = (txt ~ i.nump)               ? "Num" : "Sym"
      haVE(i[xy],pos,what,pos,txt)
      if (txt ~ i.lessp)  i[xy][pos].w= -1
      if (txt ~ i.klassp) i.klass=pos
  }}
}

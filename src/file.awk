#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"

function Csv(i) {
  Object(i); i._ako="Csv"
  has(i,"x")
  has(i,"y")
  has(i,"xy")
  has(i,"rows")
  has(i,"use")
  i.klassp = "[><!]"
  i.nump   = "[$<>]"
}

function readcsv(i,file,        txts,txt,cells, row) {
  while((getline txt < file) > 0)  {
     gsub(/[ \t\r]*/, "", txt) # no whitespce:
     gsub(/#["*"]$/,     "", txt) # no comments
     if (txt) {
       txts = txts txt
       if (txts !~ /,$/) {
         split(txts, cells, ",")
         txts = ""
         if (row) {
           holds(i.rows, row, "Row")
           RowInc(i.rows[row], i, cells)
         }
         else
           CsvHeader(i,cells)
         row++
  }}}
  close(file)
}

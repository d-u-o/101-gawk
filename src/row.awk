#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

@include "lib"

function Row(i) {
  isa(Object(i))
  has(i,"less")
  has(i,"more")
  has(i,"num")
  has(i,"sym") 
  i.class=""
}
function RowInc(i,x) {
  return 1
}
function RowZz(i) {   
  @Inc(i,22)                
}

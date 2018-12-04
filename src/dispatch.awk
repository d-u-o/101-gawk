#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function Add(x,a,   f) { f=which(x._isa,"Add");  return @f(x,a) }
function AdD(x,a,b, f) { f=which(x._isa,"Add");  return @f(x,a,b) }

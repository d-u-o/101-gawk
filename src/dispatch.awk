#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function Add(x,a,up,   f)  { f=which(x._isa,"Add",up);  return @f(x,a) }
function Show(x,a,up,   f) { f=which(x._isa,"Show",up);  return @f(x,a) }


#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function add(x,a,   f) { f=_method(x,"Add");  return @f(x,a) }
function adD(x,a,b, f) { f=_method(x,"Add");  return @f(x,a,b) }

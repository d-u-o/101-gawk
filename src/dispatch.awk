#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function dispatch(f,i,a,up) {
  f=which(i._isa,f,up)
  return @f(i,a) 
}
function Add(i,a,up)    { return dispatch("Add"  ,i,a,up) }
function Print(i,a,up)  { return dispatch("Print",i,a,up) }
function Read(i,a,up)   { return dispatch("Read" ,i,a,up) }
function Norm(i,a,up)   { return dispatch("Norm" ,i,a,up) }


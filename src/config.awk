#!/usr/bin/env ./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function settings(i) { # stuff that is fixed, or which accumulates
  new(i)
	i.ch.skip="?"
	i.ch.less="<"
	i.ch.more=">"
	i.ch.klass="!"
	i.ch.num="$"
  i.ok.pass=0
  i.ok.fail=0
}
function variables(i) { # stuff that can be reset to defaults at runtime
  i.num.cohen=0.2
}
BEGIN { 
  settings(AU) 
  variables(AU)
}

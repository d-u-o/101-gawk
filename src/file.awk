#!./gold
# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function csv(i,file,row,header,        txts,txt,cells, n) {
  header = header ? header : row
  while((getline txt < file) > 0)  {
     gsub(/[ \t\r]*/, "", txt) # no whitespce:
     gsub(/#["*"]$/,     "", txt) # no comments
     if (txt) {
       txts = txts txt
       if (txts !~ /,$/) {
         split(txts, cells, ",")
         txts = ""
         what = n ? header : row
	 @what(i,n,cells)
         n++ }}}
  close(file)
}

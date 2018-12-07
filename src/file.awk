# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function csv(i,file,row,header,fs,rs,        txts,txt,cells, n) {
  header = header ? header : row
  fs0= FS
  rs0= RS
  FS = fs ? fs : ","
  RS = rs ? rs : "\n"
  while((getline txt < file) > 0)  {
     gsub(/[ \t\r]*/, "", txt) # no whitespace:
     gsub(/#["*"]$/,     "", txt) # no comments
     if (txt) {
       txts = txts txt
       if (txts !~ /,$/) {
         split(txts, cells, ",")
         txts = ""
         what = n ? row : header
	       @what(i,n,cells)
         n++ }}}
  close(file)
  FS= fs0
  RS= rs0
}

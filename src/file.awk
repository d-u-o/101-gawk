# vim: filetype=awk: ts=2 sw=2 sts=2 expandtab:cindent:formatoptions+=cro 

function csv(i,file,row,header,fs,rs,        
             fs0,rs0,txts,txt,cells, n,what) {
  header = header ? header : row
  fs0= FS
  rs0= RS
  FS = fs 
  RS = rs 
  print "FS[" FS "] RS[" RS "]"
  while((getline txt < file) > 0)  {
     gsub(/[ \t\r]*/, "", txt) # no whitespace:
     gsub(/#["*"]$/,     "", txt) # no comments
     if (txt) {
       txts = txts txt
       if (txts !~ /,$/) {
         print "\n["txts"]"
         print(">>", split(txts, cells, FS))
         txts = ""
         what = n ? row : header
	       @what(i,n,cells)
         n++ }}}
  close(file)
  FS= fs0
  RS= rs0
}

write,format="%s\n",["\nThis will append to consortium.md a table of names from the input file",
  "consortium_names_to_build_table.txt.",
  "To add/remove a member, modify consortium_names_to_build_table.txt, and then run",
  "This function: yorick -i build_consortiummd.i",
  "consortium.md should be good.\n"];
fin = open("consortium_names_to_build_table.txt","r");
system,"cp consortium_header.txt consortium.md";
fou = open("consortium.md","a");
npercolumn = 5; // number of mugshot per line
k = 0;
write,fou,"<div style=\"align:center; width: 90%; margin-left:auto; margin-right:auto;font-size:80%;\">"
write,fou,"<table>\n<tr>";
write,format="%s","Processing row ";
while (1) {
  write,format="%d ",k++;
  for (i=1;i<=npercolumn;i++) {
    line = rdline(fin);
    if (!line) {
      write,fou,"</tr>\n</table>\n</div>";
      close,fin;
      close,fou;
      quit;
    }
    write,fou,line;
  }
  write,fou,"</tr>";
  write,fou,"<tr>";
}

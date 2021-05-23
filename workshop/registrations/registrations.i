func get_participants(file)
{
  // need to go to https://docs.google.com/forms/d/1FkKXQbJhlkpJhuKWuAd9tMFinTnzJh-taoj7XjCpHNs/edit#responses
  // and then "retrieve answers as csv"
  fname = (file?file:"Event Registration.csv");
  // read file,replace "," by \t, write in tmp file
  d = rdfile(fname);
  s = strfind("\",\"",d,n=10);
  streplace,d,s,"\t";
  f = open("/tmp/tmp.txt","w");
  write,f,d;
  close,f;
  // read tmp file
  d = rdcols("/tmp/tmp.txt",delim="\t",nskip=1);
  lastname  = (*d(3));
  w = where(lastname); w;
  for (i=1;i<=9;i++) d(i) = &(*d(i))(w);
  lastname  = (*d(3)); lastname;
  w = sort(strcase(1,lastname)); w;
  for (i=1;i<=9;i++) d(i) = &(*d(i))(w);
  tstamp    = (*d(1));
  firstname = (*d(2));
  lastname  = (*d(3));
  email     = (*d(4));
  institu   = (*d(5));
  country   = (*d(6));
  contrib   = (*d(7));
  title     = (*d(8));
  abstract  = (*d(9));

  // w = sort(strcase(1,lastname));
  wg = array(1,numberof(w));
  for (i=1;i<=numberof(w)-1;i++) {
    if ((firstname(i)==firstname(i+1))&&
    (lastname(i)==lastname(i+1))) wg(i+1)=0;
  }
  w = where(wg);
  tstamp    = tstamp(w);
  firstname = firstname(w);
  lastname  = lastname(w);
  email     = email(w);
  institu   = institu(w);
  country   = country(w);
  contrib   = contrib(w);
  title     = title(w);
  abstract  = abstract(w);
  
  lastname; w;
  streplace,firstname,[0,1],strcase(1,strpart(firstname,1:1));
  f = open("tmp.html","w");
  write,f,format="Currently, we have %d registered participants, not counting the <a href=\"#remoteparticipants\">remote participants</a>.</p>\n",numberof(lastname);
  write,f,format="%s\n","<table class=\"table table-striped table-bordered u-Margin0\">";
  write,f,format="%s\n"," <thead>";
  write,f,format="%s\n","<tr>";
  write,f,format="%s\n","<th>Full Name</th>";
  write,f,format="%s\n","<th>Affiliation</th>";
  write,f,format="%s\n","</tr>";
  write,f,format="%s\n","</thead>";
  write,f,format="%s\n","<tbody>";

  for (i=1;i<=numberof(lastname);i++) { // 1 is header, 2-3 are rigaut & dorgeville
    write,f,format="<tr><td>%s %s</td><td>%s, %s</td></tr>\n",firstname(i),lastname(i),institu(i),strcase(1,country(i));
  }
  close,f;
  system,"cat participants_head.html tmp.html participants_foot.html > ../participants.html";
  system,"rm tmp.html";
  write,format="%s\n","Updated ../participants.html from Event Registration.csv"
}

status = get_participants();
quit;

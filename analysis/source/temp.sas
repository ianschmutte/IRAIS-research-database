

%INCLUDE "../lib/header.sas";

%macro doh_validation(year);
  data dohcheck (keep = m d y doh_bad doh_missing);
    set IRAIS.irais&year.(keep=HIRE_DATE );
    m = month(HIRE_DATE);
    d = day(HIRE_DATE);
    y = year(HIRE_DATE);
    doh_bad = (m > 12 or m < 1 or d > 31 or d < 1 or y > &year. or y < 1930);
    doh_missing = (m = . or d = . or y = .);
  run;

  proc means data = dohcheck;
    var doh_missing doh_bad m d y;
    title "doh validation for year &year.";
  run;

%mend;
%doh_validation(2017);
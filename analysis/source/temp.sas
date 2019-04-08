

%INCLUDE "../lib/header.sas";

%macro pisdups_validation(year);
  data pischeck;
    set IRAIS.irais&year.(keep = pis cpf date_of_birth gender);
  run;

  proc sort data=pischeck;
    by pis;
  run;

  data pischeck;
    set pischeck;
    retain pis_count;
    by pis;
    if first.pis then count=0;
    count = count + 1;
    if last.pis and count > 1 then output;
  run;

  proc freq data=pischeck;
    tables count;
  run;


%mend;
%doh_validation(2017);
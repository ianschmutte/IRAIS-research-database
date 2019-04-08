/********************
	irais_stack.sas
	Ian M. Schmutte
	2019-March-20
	DESCRIPTION: Make table indicating what years different variables are available
  depends on 04_codebook_run.sas
*********************/


/*create view with all years of data stacked together.*/
%macro stackup;
data FASTWRK2.irais_stack / view=FASTWRK2.irais_stack;
  set 
  %DO yr=2003 %TO 2017;
    IRAIS.irais&yr.
  %END;
  ;
run;
%mend;

%stackup;
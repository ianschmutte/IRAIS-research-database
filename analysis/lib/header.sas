/*Repository location*/
%let trunk = /projects/schmutte/IRAIS-research-database;


/*input data path*/
%let irais_path = /data/CleanData/RAIS/v2019March;

/*working path*/
%let wrk_path = /temporary/IRAIS-research;

%let fast_path_1 = /fastwork1/IRAIS-research;

%let fast_path_2 = /fastwork2/IRAIS-research;


/*output paths*/
%let tabout_trunk = &trunk./release;

%let dataout_path = /data/projects/IRAIS-research;



******************************
**Libraries
******************************;
LIBNAME IRAIS     "&irais_path.";
LIBNAME INTERWRK  "&wrk_path.";
LIBNAME FASTWRK1  "&fast_path_1.";
LIBNAME FASTWRK2  "&fast_path_2.";
LIBNAME DBOUT   "&dataout_path.";


******************************
**Options
******************************;
options obs=MAX fullstimer symbolgen mprint LRECL=600 linesize=120;
ods listing; /*needed on shawshank for some mysterious reason*/
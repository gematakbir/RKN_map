************LINERAIZE DATASET - From long to wide table format *****************;
dm'log; clear; output; clear;odsresults;clear;';
%let incidence = 
Mi_i
Ma_i
Mj_i
MiMa_i
MiMj_i
MaMj_i
MiMaMj_i; *variables;
data incidence;
		set &libname;
		array raw(*) &incidence;
			do resp_n=1 to dim(raw);
				variable=Vname(raw(resp_n));
				Response=raw(resp_n);
/*				if Response NE 0; *check;*/
				output;
			end;
	drop &incidence resp_n;
proc print data=incidence (obs=36); 
Title "&libname.linear";
run;

%macro import (sheet);
proc import datafile="&path.&dat_in" dbms=xlsx out=mydat replace;
	sheet="&sheet";
	Getnames=Yes;
	proc append base=my_dat_all data=mydat force; 
quit;
%MEND import;

%let abundance = 
Mi_a
Ma_a
Mj_a
MiMa_a
MiMj_a
MaMj_a
MiMaMj_a; *variables;
data abundance;
		set &libname;
		array raw(*) &abundance;
			do resp_n=1 to dim(raw);
				variable=Vname(raw(resp_n));
				Response=raw(resp_n);
/*				if Response NE 0; *check;*/
				output;
			end;
	drop &abundance resp_n;
proc print data=abundance (obs=36); 
Title "&libname.linear";
run;

%macro import (sheet);
proc import datafile="&path.&dat_in" dbms=xlsx out=mydat replace;
	sheet="&sheet";
	Getnames=Yes;
	proc append base=my_dat_all data=mydat force; 
quit;
%MEND import;

dm'log;clear;output;clear;odsresults;clear;';	*clears most output and all log;

*-------- Proc Import Step -----; 
PROC IMPORT 
	DATAFILE= "&path.&dat_in"  
	DBMS=xlsx REPLACE
	OUT= &libname;
	SHEET = "Sheet1"; *sheet name;
    GETNAMES=YES;
RUN;
proc print data=data ;run; *(obs=5);

ods select Position;
proc contents data=data varnum; quit;
ods select all;

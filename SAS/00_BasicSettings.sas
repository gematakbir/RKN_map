*=== Run this to make you life easier down the line ===;
dm'log;clear;output;clear;odsresults;clear;';
options nodate nocenter ls=240 ps=5000 symbolgen;

*=== SET UP YOUR PATH ===;
%let path = C:\Users\gtn49005\git_repo\SAS\; *folder path;

%let dat_in = survey_data_for_sas; *name of excel spreadsheet;

%Let libname= data; *library name;

libname &libname "&path";


* to COMMENT OUT an entire line, place cursor in line and press "CTRL + /";
* to UNBLOCK an entire line, place cursor in line and press "SHFT + CTRL + /";

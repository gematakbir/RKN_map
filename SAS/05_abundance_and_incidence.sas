dm'log; clear; output; clear;odsresults;clear;';
data selected;
 	set abundance;
	lresponse = log(response+1);

	proc sort; by variable; *for 1-way ANOVA by class 1;
run;
/**/
/*proc univariate;*/
/*ods select Moments;*/
/*var response lresponse;*/
/*run;*/

ods EXCEL file = "&path.abundance_and_incidence.xlsx";

/*ods trace on; *on, off;*/
/*ods select fitstatistics;*/
ods select tests3 lsmlines; * classlevels nobs dimensions optinfo  tests3 lsmeans lsmeans diffs; *2-way ANOVA;
PROC GLIMMIX data=selected plots=residualpanel method=laplace; *method=laplace;
	class variable; *check;
	model response=variable/dist=nb;
/*	random intercept/subject=counties;*/
	lsmeans variable/pdiff adjust=tukey lines;
	run;

data selected;
 	set incidence;
	lresponse = log(response+1);

	proc sort; by variable; *for 1-way ANOVA by class 1;
run;
/**/
/*proc univariate;*/
/*ods select Moments;*/
/*var response lresponse;*/
/*run;*/

/*ods trace on; *on, off;*/
/*ods select fitstatistics;*/
ods select tests3 lsmlines; * classlevels nobs dimensions optinfo  tests3 lsmeans lsmeans diffs; *2-way ANOVA;
PROC GLIMMIX data=selected plots=residualpanel method=laplace; *method=laplace;
	class variable; *check;
	model response=variable/dist=b;
/*	random intercept/subject=counties;*/
	lsmeans variable/pdiff adjust=tukey lines;
	run;


ods EXCEL close;

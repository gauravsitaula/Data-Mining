*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set INSUR.SUBROGATENEW;
run;

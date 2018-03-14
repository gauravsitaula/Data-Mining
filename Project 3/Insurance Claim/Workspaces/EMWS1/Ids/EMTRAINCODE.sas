*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1";
filename _code catalog 'sashelp.emutil.emsample.source';
%include _code;
filename _code;
%emSample (DATA=INSUR.SUBROGATENEW, OUTPUT=EMWS1.Ids_DATA, METADATA=EMWS1.Ids_VariableSet, sizeType=PERCENT, size=20, GridTable=0);

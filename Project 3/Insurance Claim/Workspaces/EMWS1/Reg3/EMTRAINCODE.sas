*------------------------------------------------------------*;
* Reg3: Create decision matrix;
*------------------------------------------------------------*;
data WORK.SubroFlag;
  length   SubroFlag                        $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
SubroFlag="1"; COUNT=1135; DATAPRIOR=0.37372406980572; TRAINPRIOR=0.37372406980572; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
SubroFlag="0"; COUNT=1902; DATAPRIOR=0.62627593019427; TRAINPRIOR=0.62627593019427; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify SubroFlag(type=PROFIT label=SubroFlag);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.TextTopic3_TRAIN(keep=
Body Cause Nature SubroFlag TextCluster4_SVD1 TextCluster4_SVD10
TextCluster4_SVD11 TextCluster4_SVD12 TextCluster4_SVD13 TextCluster4_SVD14
TextCluster4_SVD15 TextCluster4_SVD16 TextCluster4_SVD17 TextCluster4_SVD18
TextCluster4_SVD19 TextCluster4_SVD2 TextCluster4_SVD20 TextCluster4_SVD21
TextCluster4_SVD3 TextCluster4_SVD4 TextCluster4_SVD5 TextCluster4_SVD6
TextCluster4_SVD7 TextCluster4_SVD8 TextCluster4_SVD9 TextTopic3_raw1
TextTopic3_raw10 TextTopic3_raw11 TextTopic3_raw2 TextTopic3_raw3
TextTopic3_raw4 TextTopic3_raw5 TextTopic3_raw6 TextTopic3_raw7 TextTopic3_raw8
TextTopic3_raw9 VEHflag );
run;
*------------------------------------------------------------* ;
* Reg3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Body(ASC) Cause(ASC) Nature(ASC) SubroFlag(DESC) VEHflag(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    TextCluster4_SVD1 TextCluster4_SVD10 TextCluster4_SVD11 TextCluster4_SVD12
   TextCluster4_SVD13 TextCluster4_SVD14 TextCluster4_SVD15 TextCluster4_SVD16
   TextCluster4_SVD17 TextCluster4_SVD18 TextCluster4_SVD19 TextCluster4_SVD2
   TextCluster4_SVD20 TextCluster4_SVD21 TextCluster4_SVD3 TextCluster4_SVD4
   TextCluster4_SVD5 TextCluster4_SVD6 TextCluster4_SVD7 TextCluster4_SVD8
   TextCluster4_SVD9 TextTopic3_raw1 TextTopic3_raw10 TextTopic3_raw11
   TextTopic3_raw2 TextTopic3_raw3 TextTopic3_raw4 TextTopic3_raw5 TextTopic3_raw6
   TextTopic3_raw7 TextTopic3_raw8 TextTopic3_raw9
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg3_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
SubroFlag
;
run;
quit;
*------------------------------------------------------------*;
* Reg3: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg3_DMDB
validata = EMWS1.TextTopic3_VALIDATE
outest = EMWS1.Reg3_EMESTIMATE
outterms = EMWS1.Reg3_OUTTERMS
outmap= EMWS1.Reg3_MAPDS namelen=200
;
class
SubroFlag
Body
Cause
Nature
VEHflag
;
model SubroFlag =
Body
Cause
Nature
TextCluster4_SVD1
TextCluster4_SVD10
TextCluster4_SVD11
TextCluster4_SVD12
TextCluster4_SVD13
TextCluster4_SVD14
TextCluster4_SVD15
TextCluster4_SVD16
TextCluster4_SVD17
TextCluster4_SVD18
TextCluster4_SVD19
TextCluster4_SVD2
TextCluster4_SVD20
TextCluster4_SVD21
TextCluster4_SVD3
TextCluster4_SVD4
TextCluster4_SVD5
TextCluster4_SVD6
TextCluster4_SVD7
TextCluster4_SVD8
TextCluster4_SVD9
TextTopic3_raw1
TextTopic3_raw10
TextTopic3_raw11
TextTopic3_raw2
TextTopic3_raw3
TextTopic3_raw4
TextTopic3_raw5
TextTopic3_raw6
TextTopic3_raw7
TextTopic3_raw8
TextTopic3_raw9
VEHflag
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=VMISC
Hierarchy=CLASS
Rule=NONE
SlEntry=0.3
SlStay=0.3
Start=0
Stop=0
include=0
MaxStep=100
;
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg3\EMPUBLISHSCORE.sas"
group=Reg3
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg3\EMFLOWSCORE.sas"
group=Reg3
residual
;
run;
quit;

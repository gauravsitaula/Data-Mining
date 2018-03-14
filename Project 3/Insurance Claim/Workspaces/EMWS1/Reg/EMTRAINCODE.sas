*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
set EMWS1.TextTopic_TRAIN(keep=
Body Cause Nature SubroFlag TextCluster_SVD1 TextCluster_SVD2 TextCluster_SVD3
TextCluster_SVD4 TextCluster_SVD5 TextTopic_raw1 TextTopic_raw2 TextTopic_raw3
TextTopic_raw4 TextTopic_raw5 TextTopic_raw6 VEHflag );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Body(ASC) Cause(ASC) Nature(ASC) SubroFlag(DESC) VEHflag(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    TextCluster_SVD1 TextCluster_SVD2 TextCluster_SVD3 TextCluster_SVD4
   TextCluster_SVD5 TextTopic_raw1 TextTopic_raw2 TextTopic_raw3 TextTopic_raw4
   TextTopic_raw5 TextTopic_raw6
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
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
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS1.TextTopic_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
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
TextCluster_SVD1
TextCluster_SVD2
TextCluster_SVD3
TextCluster_SVD4
TextCluster_SVD5
TextTopic_raw1
TextTopic_raw2
TextTopic_raw3
TextTopic_raw4
TextTopic_raw5
TextTopic_raw6
VEHflag
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=VMISC
Hierarchy=CLASS
Rule=NONE
SlEntry=0.15
SlStay=0.15
Start=0
Stop=0
include=0
MaxStep=100
;
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;

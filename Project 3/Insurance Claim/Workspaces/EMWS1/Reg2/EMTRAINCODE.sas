*------------------------------------------------------------*;
* Reg2: Create decision matrix;
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
set EMWS1.TextTopic2_TRAIN(keep=
Body Cause Nature SubroFlag TextCluster2_SVD1 TextCluster2_SVD10
TextCluster2_SVD2 TextCluster2_SVD3 TextCluster2_SVD4 TextCluster2_SVD5
TextCluster2_SVD6 TextCluster2_SVD7 TextCluster2_SVD8 TextCluster2_SVD9
TextTopic2_raw1 TextTopic2_raw2 TextTopic2_raw3 TextTopic2_raw4 TextTopic2_raw5
TextTopic2_raw6 TextTopic2_raw7 TextTopic2_raw8 TextTopic2_raw9 VEHflag );
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Body(ASC) Cause(ASC) Nature(ASC) SubroFlag(DESC) VEHflag(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    TextCluster2_SVD1 TextCluster2_SVD10 TextCluster2_SVD2 TextCluster2_SVD3
   TextCluster2_SVD4 TextCluster2_SVD5 TextCluster2_SVD6 TextCluster2_SVD7
   TextCluster2_SVD8 TextCluster2_SVD9 TextTopic2_raw1 TextTopic2_raw2
   TextTopic2_raw3 TextTopic2_raw4 TextTopic2_raw5 TextTopic2_raw6 TextTopic2_raw7
   TextTopic2_raw8 TextTopic2_raw9
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
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
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS1.TextTopic2_VALIDATE
outest = EMWS1.Reg2_EMESTIMATE
outterms = EMWS1.Reg2_OUTTERMS
outmap= EMWS1.Reg2_MAPDS namelen=200
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
TextCluster2_SVD1
TextCluster2_SVD10
TextCluster2_SVD2
TextCluster2_SVD3
TextCluster2_SVD4
TextCluster2_SVD5
TextCluster2_SVD6
TextCluster2_SVD7
TextCluster2_SVD8
TextCluster2_SVD9
TextTopic2_raw1
TextTopic2_raw2
TextTopic2_raw3
TextTopic2_raw4
TextTopic2_raw5
TextTopic2_raw6
TextTopic2_raw7
TextTopic2_raw8
TextTopic2_raw9
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
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 3\Insurance Claim\Workspaces\EMWS1\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;

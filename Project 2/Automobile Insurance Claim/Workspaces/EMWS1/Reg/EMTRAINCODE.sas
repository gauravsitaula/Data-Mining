*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.CLAIM_IND;
  length   CLAIM_IND                        $  32
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
CLAIM_IND="1"; COUNT=2230; DATAPRIOR=0.27063106796116; TRAINPRIOR=0.27063106796116; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
CLAIM_IND="0"; COUNT=6010; DATAPRIOR=0.72936893203883; TRAINPRIOR=0.72936893203883; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify CLAIM_IND(type=PROFIT label=CLAIM_IND);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.Impt_TRAIN(keep=
AREA CAR_USE CHILDREN CHILD_DRIV CLAIM_IND CLM_FREQ DISTANCE EDU_LEVEL GENDER
IMP_AGE IMP_JOB IMP_LOG_HOUSE_VAL IMP_LOG_INCOME IMP_VEHICLE_AGE IMP_YOJ
LOG_VEHICLE_VAL MVR_PTS M_AGE M_JOB M_LOG_HOUSE_VAL M_LOG_INCOME M_VEHICLE_AGE
M_YOJ REVOKED STATE_CODE STATUS VEHICLE_TYPE );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AREA(ASC) CAR_USE(ASC) CLAIM_IND(DESC) EDU_LEVEL(ASC) GENDER(ASC) IMP_JOB(ASC)
   M_AGE(ASC) M_JOB(ASC) M_LOG_HOUSE_VAL(ASC) M_LOG_INCOME(ASC) M_VEHICLE_AGE(ASC)
   M_YOJ(ASC) REVOKED(ASC) STATE_CODE(ASC) STATUS(ASC) VEHICLE_TYPE(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    CHILDREN CHILD_DRIV CLM_FREQ DISTANCE IMP_AGE IMP_LOG_HOUSE_VAL IMP_LOG_INCOME
   IMP_VEHICLE_AGE IMP_YOJ LOG_VEHICLE_VAL MVR_PTS
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
CLAIM_IND
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS1.Impt_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
CLAIM_IND
AREA
CAR_USE
EDU_LEVEL
GENDER
IMP_JOB
M_AGE
M_JOB
M_LOG_HOUSE_VAL
M_LOG_INCOME
M_VEHICLE_AGE
M_YOJ
REVOKED
STATE_CODE
STATUS
VEHICLE_TYPE
;
model CLAIM_IND =
AREA
CAR_USE
CHILDREN
CHILD_DRIV
CLM_FREQ
DISTANCE
EDU_LEVEL
GENDER
IMP_AGE
IMP_JOB
IMP_LOG_HOUSE_VAL
IMP_LOG_INCOME
IMP_VEHICLE_AGE
IMP_YOJ
LOG_VEHICLE_VAL
MVR_PTS
M_AGE
M_JOB
M_LOG_HOUSE_VAL
M_LOG_INCOME
M_VEHICLE_AGE
M_YOJ
REVOKED
STATE_CODE
STATUS
VEHICLE_TYPE
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=VMISC
Hierarchy=CLASS
Rule=NONE
SlEntry=0.25
SlStay=0.15
Start=0
Stop=0
include=0
MaxStep=30
;
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 2\Automobile Insurance Claim\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 2\Automobile Insurance Claim\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;

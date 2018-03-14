*------------------------------------------------------------*;
* Neural: Create decision matrix;
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
data EM_Neural;
set EMWS1.Reg_TRAIN(keep=
AREA CAR_USE CHILD_DRIV CLAIM_IND CLM_FREQ DISTANCE EDU_LEVEL IMP_JOB
IMP_LOG_INCOME LOG_VEHICLE_VAL MVR_PTS M_YOJ REVOKED STATUS VEHICLE_TYPE );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AREA(ASC) CAR_USE(ASC) CLAIM_IND(DESC) EDU_LEVEL(ASC) IMP_JOB(ASC) M_YOJ(ASC)
   REVOKED(ASC) STATUS(ASC) VEHICLE_TYPE(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    CHILD_DRIV CLM_FREQ DISTANCE IMP_LOG_INCOME LOG_VEHICLE_VAL MVR_PTS
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
CLAIM_IND
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    CHILD_DRIV CLM_FREQ DISTANCE IMP_LOG_INCOME LOG_VEHICLE_VAL MVR_PTS
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AREA CAR_USE M_YOJ REVOKED
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    EDU_LEVEL IMP_JOB STATUS VEHICLE_TYPE
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Reg_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %BININPUTS / level=nominal id=bin
;
input %NOMINPUTS / level=nominal id=nom
;
target CLAIM_IND / level=NOMINAL id=CLAIM_IND
bias
;
arch MLP
Hidden=5
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural_PRELIM_OUTEST
;
save network=EMWS1.Neural_NETWORK.dm_neural;
train Maxiter=100
maxtime=14400
Outest=EMWS1.Neural_outest estiter=1
Outfit=EMWS1.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural_INITIAL;
set EMWS1.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Reg_VALIDATE
network = EMWS1.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 2\Automobile Insurance Claim\Workspaces\EMWS1\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\Gaurav\Desktop\second sem\Data Mining\Project 2\Automobile Insurance Claim\Workspaces\EMWS1\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS1.Reg_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural_OUTKEY;
score data=EMWS1.Reg_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural_OUTKEY;
run;
quit;
data EMWS1.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural_EMESTIMATE;
set EMWS1.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;

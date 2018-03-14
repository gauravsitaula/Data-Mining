***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
      F_CLAIM_IND  $ 12
;
      label S_CHILD_DRIV = 'Standard: CHILD_DRIV' ;

      label S_CLM_FREQ = 'Standard: CLM_FREQ' ;

      label S_DISTANCE = 'Standard: DISTANCE' ;

      label S_IMP_LOG_INCOME = 'Standard: IMP_LOG_INCOME' ;

      label S_LOG_VEHICLE_VAL = 'Standard: LOG_VEHICLE_VAL' ;

      label S_MVR_PTS = 'Standard: MVR_PTS' ;

      label AREAHighly_Urban__Urban = 'Dummy: AREA=Highly Urban/ Urban' ;

      label CAR_USECommercial = 'Dummy: CAR_USE=Commercial' ;

      label M_YOJ0 = 'Dummy: M_YOJ=0' ;

      label REVOKEDNo = 'Dummy: REVOKED=No' ;

      label EDU_LEVEL_High_School = 'Dummy: EDU_LEVEL=<High School' ;

      label EDU_LEVELBachelors = 'Dummy: EDU_LEVEL=Bachelors' ;

      label EDU_LEVELMasters = 'Dummy: EDU_LEVEL=Masters' ;

      label EDU_LEVELPhD = 'Dummy: EDU_LEVEL=PhD' ;

      label IMP_JOBBanking = 'Dummy: IMP_JOB=Banking' ;

      label IMP_JOBClerical = 'Dummy: IMP_JOB=Clerical' ;

      label IMP_JOBDoctor = 'Dummy: IMP_JOB=Doctor' ;

      label IMP_JOBHome_Maker = 'Dummy: IMP_JOB=Home Maker' ;

      label IMP_JOBManager = 'Dummy: IMP_JOB=Manager' ;

      label IMP_JOBNone = 'Dummy: IMP_JOB=None' ;

      label IMP_JOBNurse = 'Dummy: IMP_JOB=Nurse' ;

      label IMP_JOBPolice = 'Dummy: IMP_JOB=Police' ;

      label IMP_JOBProfessional = 'Dummy: IMP_JOB=Professional' ;

      label IMP_JOBStudent = 'Dummy: IMP_JOB=Student' ;

      label STATUSYes = 'Dummy: STATUS=Yes' ;

      label VEHICLE_TYPEFamily = 'Dummy: VEHICLE_TYPE=Family' ;

      label VEHICLE_TYPEMinivan = 'Dummy: VEHICLE_TYPE=Minivan' ;

      label VEHICLE_TYPEPanel_Truck = 'Dummy: VEHICLE_TYPE=Panel Truck' ;

      label VEHICLE_TYPEPickup = 'Dummy: VEHICLE_TYPE=Pickup' ;

      label VEHICLE_TYPERacing = 'Dummy: VEHICLE_TYPE=Racing' ;

      label VEHICLE_TYPESports_Car = 'Dummy: VEHICLE_TYPE=Sports Car' ;

      label VEHICLE_TYPEVan = 'Dummy: VEHICLE_TYPE=Van' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label I_CLAIM_IND = 'Into: CLAIM_IND' ;

      label F_CLAIM_IND = 'From: CLAIM_IND' ;

      label U_CLAIM_IND = 'Unnormalized Into: CLAIM_IND' ;

      label P_CLAIM_IND1 = 'Predicted: CLAIM_IND=1' ;

      label R_CLAIM_IND1 = 'Residual: CLAIM_IND=1' ;

      label P_CLAIM_IND0 = 'Predicted: CLAIM_IND=0' ;

      label R_CLAIM_IND0 = 'Residual: CLAIM_IND=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for AREA ;
drop AREAHighly_Urban__Urban ;
if missing( AREA ) then do;
   AREAHighly_Urban__Urban = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm21 $ 21; drop _dm21 ;
   %DMNORMCP( AREA , _dm21 )
   if _dm21 = 'HIGHLY URBAN/ URBAN'  then do;
      AREAHighly_Urban__Urban = 1;
   end;
   else if _dm21 = 'Z_HIGHLY RURAL/ RURAL'  then do;
      AREAHighly_Urban__Urban = -1;
   end;
   else do;
      AREAHighly_Urban__Urban = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for CAR_USE ;
drop CAR_USECommercial ;
if missing( CAR_USE ) then do;
   CAR_USECommercial = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   %DMNORMCP( CAR_USE , _dm10 )
   if _dm10 = 'PRIVATE'  then do;
      CAR_USECommercial = -1;
   end;
   else if _dm10 = 'COMMERCIAL'  then do;
      CAR_USECommercial = 1;
   end;
   else do;
      CAR_USECommercial = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for M_YOJ ;
drop M_YOJ0 ;
if missing( M_YOJ ) then do;
   M_YOJ0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( M_YOJ , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      M_YOJ0 = 1;
   end;
   else if _dm12 = '1'  then do;
      M_YOJ0 = -1;
   end;
   else do;
      M_YOJ0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for REVOKED ;
drop REVOKEDNo ;
if missing( REVOKED ) then do;
   REVOKEDNo = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm3 $ 3; drop _dm3 ;
   %DMNORMCP( REVOKED , _dm3 )
   if _dm3 = 'NO'  then do;
      REVOKEDNo = 1;
   end;
   else if _dm3 = 'YES'  then do;
      REVOKEDNo = -1;
   end;
   else do;
      REVOKEDNo = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for EDU_LEVEL ;
drop EDU_LEVEL_High_School EDU_LEVELBachelors EDU_LEVELMasters EDU_LEVELPhD ;
*** encoding is sparse, initialize to zero;
EDU_LEVEL_High_School = 0;
EDU_LEVELBachelors = 0;
EDU_LEVELMasters = 0;
EDU_LEVELPhD = 0;
if missing( EDU_LEVEL ) then do;
   EDU_LEVEL_High_School = .;
   EDU_LEVELBachelors = .;
   EDU_LEVELMasters = .;
   EDU_LEVELPhD = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm13 $ 13; drop _dm13 ;
   %DMNORMCP( EDU_LEVEL , _dm13 )
   if _dm13 = 'Z_HIGH SCHOOL'  then do;
      EDU_LEVEL_High_School = -1;
      EDU_LEVELBachelors = -1;
      EDU_LEVELMasters = -1;
      EDU_LEVELPhD = -1;
   end;
   else if _dm13 = 'BACHELORS'  then do;
      EDU_LEVELBachelors = 1;
   end;
   else if _dm13 = 'MASTERS'  then do;
      EDU_LEVELMasters = 1;
   end;
   else if _dm13 = '<HIGH SCHOOL'  then do;
      EDU_LEVEL_High_School = 1;
   end;
   else if _dm13 = 'PHD'  then do;
      EDU_LEVELPhD = 1;
   end;
   else do;
      EDU_LEVEL_High_School = .;
      EDU_LEVELBachelors = .;
      EDU_LEVELMasters = .;
      EDU_LEVELPhD = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_JOB ;
drop IMP_JOBBanking IMP_JOBClerical IMP_JOBDoctor IMP_JOBHome_Maker
        IMP_JOBManager IMP_JOBNone IMP_JOBNurse IMP_JOBPolice
        IMP_JOBProfessional IMP_JOBStudent ;
*** encoding is sparse, initialize to zero;
IMP_JOBBanking = 0;
IMP_JOBClerical = 0;
IMP_JOBDoctor = 0;
IMP_JOBHome_Maker = 0;
IMP_JOBManager = 0;
IMP_JOBNone = 0;
IMP_JOBNurse = 0;
IMP_JOBPolice = 0;
IMP_JOBProfessional = 0;
IMP_JOBStudent = 0;
if missing( IMP_JOB ) then do;
   IMP_JOBBanking = .;
   IMP_JOBClerical = .;
   IMP_JOBDoctor = .;
   IMP_JOBHome_Maker = .;
   IMP_JOBManager = .;
   IMP_JOBNone = .;
   IMP_JOBNurse = .;
   IMP_JOBPolice = .;
   IMP_JOBProfessional = .;
   IMP_JOBStudent = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm13 $ 13; drop _dm13 ;
   _dm13 = put( IMP_JOB , $13. );
   %DMNORMIP( _dm13 )
   _dm_find = 0; drop _dm_find;
   if _dm13 <= 'NONE'  then do;
      if _dm13 <= 'DOCTOR'  then do;
         if _dm13 <= 'CLERICAL'  then do;
            if _dm13 = 'BANKING'  then do;
               IMP_JOBBanking = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm13 = 'CLERICAL'  then do;
                  IMP_JOBClerical = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm13 = 'DOCTOR'  then do;
               IMP_JOBDoctor = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm13 <= 'MANAGER'  then do;
            if _dm13 = 'HOME MAKER'  then do;
               IMP_JOBHome_Maker = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm13 = 'MANAGER'  then do;
                  IMP_JOBManager = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm13 = 'NONE'  then do;
               IMP_JOBNone = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm13 <= 'PROFESSIONAL'  then do;
         if _dm13 <= 'POLICE'  then do;
            if _dm13 = 'NURSE'  then do;
               IMP_JOBNurse = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm13 = 'POLICE'  then do;
                  IMP_JOBPolice = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm13 = 'PROFESSIONAL'  then do;
               IMP_JOBProfessional = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm13 = 'STUDENT'  then do;
            IMP_JOBStudent = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm13 = 'TEACHER'  then do;
               IMP_JOBBanking = -1;
               IMP_JOBClerical = -1;
               IMP_JOBDoctor = -1;
               IMP_JOBHome_Maker = -1;
               IMP_JOBManager = -1;
               IMP_JOBNone = -1;
               IMP_JOBNurse = -1;
               IMP_JOBPolice = -1;
               IMP_JOBProfessional = -1;
               IMP_JOBStudent = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      IMP_JOBBanking = .;
      IMP_JOBClerical = .;
      IMP_JOBDoctor = .;
      IMP_JOBHome_Maker = .;
      IMP_JOBManager = .;
      IMP_JOBNone = .;
      IMP_JOBNurse = .;
      IMP_JOBPolice = .;
      IMP_JOBProfessional = .;
      IMP_JOBStudent = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for STATUS ;
drop STATUSYes ;
if missing( STATUS ) then do;
   STATUSYes = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm5 $ 5; drop _dm5 ;
   %DMNORMCP( STATUS , _dm5 )
   if _dm5 = 'YES'  then do;
      STATUSYes = 1;
   end;
   else if _dm5 = 'Z_NO'  then do;
      STATUSYes = -1;
   end;
   else do;
      STATUSYes = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for VEHICLE_TYPE ;
drop VEHICLE_TYPEFamily VEHICLE_TYPEMinivan VEHICLE_TYPEPanel_Truck
        VEHICLE_TYPEPickup VEHICLE_TYPERacing VEHICLE_TYPESports_Car
        VEHICLE_TYPEVan ;
*** encoding is sparse, initialize to zero;
VEHICLE_TYPEFamily = 0;
VEHICLE_TYPEMinivan = 0;
VEHICLE_TYPEPanel_Truck = 0;
VEHICLE_TYPEPickup = 0;
VEHICLE_TYPERacing = 0;
VEHICLE_TYPESports_Car = 0;
VEHICLE_TYPEVan = 0;
if missing( VEHICLE_TYPE ) then do;
   VEHICLE_TYPEFamily = .;
   VEHICLE_TYPEMinivan = .;
   VEHICLE_TYPEPanel_Truck = .;
   VEHICLE_TYPEPickup = .;
   VEHICLE_TYPERacing = .;
   VEHICLE_TYPESports_Car = .;
   VEHICLE_TYPEVan = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm11 $ 11; drop _dm11 ;
   %DMNORMCP( VEHICLE_TYPE , _dm11 )
   _dm_find = 0; drop _dm_find;
   if _dm11 <= 'PICKUP'  then do;
      if _dm11 <= 'MINIVAN'  then do;
         if _dm11 = 'FAMILY'  then do;
            VEHICLE_TYPEFamily = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm11 = 'MINIVAN'  then do;
               VEHICLE_TYPEMinivan = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm11 = 'PANEL TRUCK'  then do;
            VEHICLE_TYPEPanel_Truck = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm11 = 'PICKUP'  then do;
               VEHICLE_TYPEPickup = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm11 <= 'SPORTS CAR'  then do;
         if _dm11 = 'RACING'  then do;
            VEHICLE_TYPERacing = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm11 = 'SPORTS CAR'  then do;
               VEHICLE_TYPESports_Car = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm11 = 'UNKNOWN'  then do;
            VEHICLE_TYPEFamily = -1;
            VEHICLE_TYPEMinivan = -1;
            VEHICLE_TYPEPanel_Truck = -1;
            VEHICLE_TYPEPickup = -1;
            VEHICLE_TYPERacing = -1;
            VEHICLE_TYPESports_Car = -1;
            VEHICLE_TYPEVan = -1;
            _dm_find = 1;
         end;
         else do;
            if _dm11 = 'VAN'  then do;
               VEHICLE_TYPEVan = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      VEHICLE_TYPEFamily = .;
      VEHICLE_TYPEMinivan = .;
      VEHICLE_TYPEPanel_Truck = .;
      VEHICLE_TYPEPickup = .;
      VEHICLE_TYPERacing = .;
      VEHICLE_TYPESports_Car = .;
      VEHICLE_TYPEVan = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   CHILD_DRIV ,
   CLM_FREQ ,
   DISTANCE ,
   IMP_LOG_INCOME ,
   LOG_VEHICLE_VAL ,
   MVR_PTS   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CHILD_DRIV  =    -0.33889829319443 +     1.98236245933903 * CHILD_DRIV ;
   S_CLM_FREQ  =    -1.18335194737188 +     0.66003566562067 * CLM_FREQ ;
   S_DISTANCE  =    -4.92891307224816 +     0.06256903395884 * DISTANCE ;
   S_IMP_LOG_INCOME  =    -7.71975589401575 +     0.73483797312181 *
        IMP_LOG_INCOME ;
   S_LOG_VEHICLE_VAL  =    -14.7013556030914 +     1.55052342831751 *
        LOG_VEHICLE_VAL ;
   S_MVR_PTS  =    -1.22354744241005 +     0.37986794088092 * MVR_PTS ;
END;
ELSE DO;
   IF MISSING( CHILD_DRIV ) THEN S_CHILD_DRIV  = . ;
   ELSE S_CHILD_DRIV  =    -0.33889829319443 +     1.98236245933903 *
        CHILD_DRIV ;
   IF MISSING( CLM_FREQ ) THEN S_CLM_FREQ  = . ;
   ELSE S_CLM_FREQ  =    -1.18335194737188 +     0.66003566562067 * CLM_FREQ ;
   IF MISSING( DISTANCE ) THEN S_DISTANCE  = . ;
   ELSE S_DISTANCE  =    -4.92891307224816 +     0.06256903395884 * DISTANCE ;
   IF MISSING( IMP_LOG_INCOME ) THEN S_IMP_LOG_INCOME  = . ;
   ELSE S_IMP_LOG_INCOME  =    -7.71975589401575 +     0.73483797312181 *
        IMP_LOG_INCOME ;
   IF MISSING( LOG_VEHICLE_VAL ) THEN S_LOG_VEHICLE_VAL  = . ;
   ELSE S_LOG_VEHICLE_VAL  =    -14.7013556030914 +     1.55052342831751 *
        LOG_VEHICLE_VAL ;
   IF MISSING( MVR_PTS ) THEN S_MVR_PTS  = . ;
   ELSE S_MVR_PTS  =    -1.22354744241005 +     0.37986794088092 * MVR_PTS ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -0.1252378074658 * S_CHILD_DRIV  +     0.09408574105602 *
        S_CLM_FREQ  +    -0.07946846054203 * S_DISTANCE
          +     0.00841139818475 * S_IMP_LOG_INCOME  +    -0.38957464959927 *
        S_LOG_VEHICLE_VAL  +    -0.17788416999258 * S_MVR_PTS ;
   H12  =    -0.20757966026726 * S_CHILD_DRIV  +    -0.10902479833941 *
        S_CLM_FREQ  +     0.03432411285676 * S_DISTANCE
          +     0.07241010606637 * S_IMP_LOG_INCOME  +     0.14171911009909 *
        S_LOG_VEHICLE_VAL  +    -0.23938254396847 * S_MVR_PTS ;
   H13  =      0.0152623414381 * S_CHILD_DRIV  +      0.0242266546183 *
        S_CLM_FREQ  +    -0.40476149909825 * S_DISTANCE
          +     0.24385773761884 * S_IMP_LOG_INCOME  +     0.10439093147282 *
        S_LOG_VEHICLE_VAL  +     0.02589402426179 * S_MVR_PTS ;
   H14  =     0.17995797588877 * S_CHILD_DRIV  +     0.06573232117785 *
        S_CLM_FREQ  +     0.09547306793793 * S_DISTANCE
          +     0.02947537838749 * S_IMP_LOG_INCOME  +     0.06424319514932 *
        S_LOG_VEHICLE_VAL  +    -0.09430275588411 * S_MVR_PTS ;
   H15  =    -0.16237500595013 * S_CHILD_DRIV  +    -0.06759509101746 *
        S_CLM_FREQ  +     0.08264282633625 * S_DISTANCE
          +    -0.43427175295388 * S_IMP_LOG_INCOME  +     0.00206610743942 *
        S_LOG_VEHICLE_VAL  +    -0.01036610365646 * S_MVR_PTS ;
   H11  = H11  +     0.10330274635216 * AREAHighly_Urban__Urban
          +    -0.13536656726171 * CAR_USECommercial
          +     0.24635675473307 * M_YOJ0  +    -0.00353047570297 * REVOKEDNo
         ;
   H12  = H12  +    -0.72361958024483 * AREAHighly_Urban__Urban
          +    -0.19683060426702 * CAR_USECommercial
          +      0.1546229365424 * M_YOJ0  +    -0.11828897886945 * REVOKEDNo
         ;
   H13  = H13  +     -0.1968870084944 * AREAHighly_Urban__Urban
          +    -0.11419679788138 * CAR_USECommercial
          +    -0.08579965938502 * M_YOJ0  +     0.04069984887363 * REVOKEDNo
         ;
   H14  = H14  +      0.3756494564891 * AREAHighly_Urban__Urban
          +     0.01718396842312 * CAR_USECommercial
          +    -0.18790984790795 * M_YOJ0  +    -0.26122208587085 * REVOKEDNo
         ;
   H15  = H15  +     0.45031626809909 * AREAHighly_Urban__Urban
          +     0.18312708887385 * CAR_USECommercial
          +     0.16247004537545 * M_YOJ0  +    -0.28331520830214 * REVOKEDNo
         ;
   H11  = H11  +     0.17300254217076 * EDU_LEVEL_High_School
          +    -0.00337395451316 * EDU_LEVELBachelors
          +     0.00875474659916 * EDU_LEVELMasters  +    -0.08565040121022 *
        EDU_LEVELPhD  +    -0.06986035759261 * IMP_JOBBanking
          +     0.04850709510363 * IMP_JOBClerical  +     -0.2982277772542 *
        IMP_JOBDoctor  +     0.10896991556589 * IMP_JOBHome_Maker
          +     0.03794641786246 * IMP_JOBManager  +    -0.03151051727722 *
        IMP_JOBNone  +    -0.06120477592314 * IMP_JOBNurse
          +     0.29775783361704 * IMP_JOBPolice  +    -0.18430507294012 *
        IMP_JOBProfessional  +     0.03502420567248 * IMP_JOBStudent
          +     0.03239045387589 * STATUSYes  +    -0.00043259759814 *
        VEHICLE_TYPEFamily  +    -0.16192825250518 * VEHICLE_TYPEMinivan
          +     0.09320447463126 * VEHICLE_TYPEPanel_Truck
          +     0.24022891019073 * VEHICLE_TYPEPickup
          +     0.09747826531222 * VEHICLE_TYPERacing
          +    -0.23932091258751 * VEHICLE_TYPESports_Car
          +    -0.13947192218984 * VEHICLE_TYPEVan ;
   H12  = H12  +    -0.24067336974208 * EDU_LEVEL_High_School
          +      0.0993434567293 * EDU_LEVELBachelors
          +     0.28374667780048 * EDU_LEVELMasters  +     0.40715354997677 *
        EDU_LEVELPhD  +    -0.07127803588024 * IMP_JOBBanking
          +    -0.28763219470482 * IMP_JOBClerical  +     0.10087267931556 *
        IMP_JOBDoctor  +     0.08098977985857 * IMP_JOBHome_Maker
          +     0.38669781180368 * IMP_JOBManager  +     0.04430411601632 *
        IMP_JOBNone  +    -0.37978805878021 * IMP_JOBNurse
          +    -0.48413141489338 * IMP_JOBPolice  +     0.10090637437493 *
        IMP_JOBProfessional  +     0.11996423068589 * IMP_JOBStudent
          +     0.12168946254826 * STATUSYes  +     0.01327223153299 *
        VEHICLE_TYPEFamily  +     0.33025959542867 * VEHICLE_TYPEMinivan
          +    -0.04886183077006 * VEHICLE_TYPEPanel_Truck
          +    -0.12533010441225 * VEHICLE_TYPEPickup
          +     0.11531405526395 * VEHICLE_TYPERacing
          +     0.12635876022536 * VEHICLE_TYPESports_Car
          +     0.05706866455416 * VEHICLE_TYPEVan ;
   H13  = H13  +    -0.13198299387646 * EDU_LEVEL_High_School
          +     0.07952581536262 * EDU_LEVELBachelors
          +    -0.04814058636927 * EDU_LEVELMasters  +     0.06274024346926 *
        EDU_LEVELPhD  +     -0.2005165876453 * IMP_JOBBanking
          +    -0.00915683041459 * IMP_JOBClerical  +     0.20097021636982 *
        IMP_JOBDoctor  +     0.02679241132525 * IMP_JOBHome_Maker
          +     0.37587954695574 * IMP_JOBManager  +     0.25082021118807 *
        IMP_JOBNone  +     0.06377653035254 * IMP_JOBNurse
          +     0.16550460280677 * IMP_JOBPolice  +    -0.09241142872098 *
        IMP_JOBProfessional  +     0.05704133115144 * IMP_JOBStudent
          +     0.00263674742168 * STATUSYes  +    -0.06640480329391 *
        VEHICLE_TYPEFamily  +     0.04876392351213 * VEHICLE_TYPEMinivan
          +      0.0656801233804 * VEHICLE_TYPEPanel_Truck
          +     0.06231801230658 * VEHICLE_TYPEPickup
          +    -0.23259576170321 * VEHICLE_TYPERacing
          +    -0.15377055909618 * VEHICLE_TYPESports_Car
          +     0.00640185536184 * VEHICLE_TYPEVan ;
   H14  = H14  +    -0.26315700936106 * EDU_LEVEL_High_School
          +     0.22074289716418 * EDU_LEVELBachelors
          +     0.18628296340056 * EDU_LEVELMasters  +     0.09986605216592 *
        EDU_LEVELPhD  +     -0.2622112559314 * IMP_JOBBanking
          +     0.03725875781862 * IMP_JOBClerical  +    -0.07200253248292 *
        IMP_JOBDoctor  +    -0.07871363415609 * IMP_JOBHome_Maker
          +     0.15100009342818 * IMP_JOBManager  +     0.17694225925447 *
        IMP_JOBNone  +    -0.14173626127119 * IMP_JOBNurse
          +     0.05751500881654 * IMP_JOBPolice  +     0.00104277589997 *
        IMP_JOBProfessional  +     0.18519010022872 * IMP_JOBStudent
          +    -0.33944129562496 * STATUSYes  +     0.20718129090899 *
        VEHICLE_TYPEFamily  +     -0.2188927779257 * VEHICLE_TYPEMinivan
          +     0.03043081902611 * VEHICLE_TYPEPanel_Truck
          +      -0.214703107256 * VEHICLE_TYPEPickup
          +     0.13940551771385 * VEHICLE_TYPERacing
          +      0.4635566353328 * VEHICLE_TYPESports_Car
          +     0.01281973104976 * VEHICLE_TYPEVan ;
   H15  = H15  +     0.19729039886182 * EDU_LEVEL_High_School
          +    -0.05396286074248 * EDU_LEVELBachelors
          +    -0.10042909376128 * EDU_LEVELMasters  +    -0.04584335398667 *
        EDU_LEVELPhD  +    -0.22015306379087 * IMP_JOBBanking
          +      0.0766182810605 * IMP_JOBClerical  +    -0.24293129283995 *
        IMP_JOBDoctor  +    -0.30036559972736 * IMP_JOBHome_Maker
          +    -0.10753756574605 * IMP_JOBManager  +     0.04247424577455 *
        IMP_JOBNone  +     0.06282611570352 * IMP_JOBNurse
          +     -0.0930542371959 * IMP_JOBPolice  +      0.1854148864381 *
        IMP_JOBProfessional  +    -0.27933332170021 * IMP_JOBStudent
          +    -0.09884602955679 * STATUSYes  +     0.08996010965121 *
        VEHICLE_TYPEFamily  +     0.06976660786142 * VEHICLE_TYPEMinivan
          +    -0.10840272554205 * VEHICLE_TYPEPanel_Truck
          +     0.13713991315689 * VEHICLE_TYPEPickup
          +     0.01170632312308 * VEHICLE_TYPERacing
          +     0.07721114936642 * VEHICLE_TYPESports_Car
          +     0.27531715268863 * VEHICLE_TYPEVan ;
   H11  =     2.08268740392997 + H11 ;
   H12  =     0.68610985953751 + H12 ;
   H13  =    -1.10419541996227 + H13 ;
   H14  =    -0.89819562131402 + H14 ;
   H15  =    -1.65400322910692 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node CLAIM_IND ;
*** *************************;

*** Generate dummy variables for CLAIM_IND ;
drop CLAIM_IND1 CLAIM_IND0 ;
label F_CLAIM_IND = 'From: CLAIM_IND' ;
length F_CLAIM_IND $ 12;
F_CLAIM_IND = put( CLAIM_IND , BEST12. );
%DMNORMIP( F_CLAIM_IND )
if missing( CLAIM_IND ) then do;
   CLAIM_IND1 = .;
   CLAIM_IND0 = .;
end;
else do;
   if F_CLAIM_IND = '0'  then do;
      CLAIM_IND1 = 0;
      CLAIM_IND0 = 1;
   end;
   else if F_CLAIM_IND = '1'  then do;
      CLAIM_IND1 = 1;
      CLAIM_IND0 = 0;
   end;
   else do;
      CLAIM_IND1 = .;
      CLAIM_IND0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_CLAIM_IND1  =     0.40408785707406 * H11  +    -1.68666042712376 * H12
          +    -1.88021541558799 * H13  +     1.91127916472255 * H14
          +     0.99093191656244 * H15 ;
   P_CLAIM_IND1  =    -0.60088045314461 + P_CLAIM_IND1 ;
   P_CLAIM_IND0  = 0;
   _MAX_ = MAX (P_CLAIM_IND1 , P_CLAIM_IND0 );
   _SUM_ = 0.;
   P_CLAIM_IND1  = EXP(P_CLAIM_IND1  - _MAX_);
   _SUM_ = _SUM_ + P_CLAIM_IND1 ;
   P_CLAIM_IND0  = EXP(P_CLAIM_IND0  - _MAX_);
   _SUM_ = _SUM_ + P_CLAIM_IND0 ;
   P_CLAIM_IND1  = P_CLAIM_IND1  / _SUM_;
   P_CLAIM_IND0  = P_CLAIM_IND0  / _SUM_;
END;
ELSE DO;
   P_CLAIM_IND1  = .;
   P_CLAIM_IND0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_CLAIM_IND1  =     0.27051966974259;
   P_CLAIM_IND0  =      0.7294803302574;
END;
*** *****************************;
*** Writing the Residuals  of the Node CLAIM_IND ;
*** ******************************;
IF MISSING( CLAIM_IND1 ) THEN R_CLAIM_IND1  = . ;
ELSE R_CLAIM_IND1  = CLAIM_IND1  - P_CLAIM_IND1 ;
IF MISSING( CLAIM_IND0 ) THEN R_CLAIM_IND0  = . ;
ELSE R_CLAIM_IND0  = CLAIM_IND0  - P_CLAIM_IND0 ;
*** *************************;
*** Writing the I_CLAIM_IND  AND U_CLAIM_IND ;
*** *************************;
_MAXP_ = P_CLAIM_IND1 ;
I_CLAIM_IND  = "1           " ;
U_CLAIM_IND  =                    1;
IF( _MAXP_ LT P_CLAIM_IND0  ) THEN DO;
   _MAXP_ = P_CLAIM_IND0 ;
   I_CLAIM_IND  = "0           " ;
   U_CLAIM_IND  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
H14
H15
;
drop S_:;

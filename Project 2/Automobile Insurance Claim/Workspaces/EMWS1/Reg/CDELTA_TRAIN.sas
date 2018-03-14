if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AREA'
'CAR_USE'
'CHILD_DRIV'
'CLM_FREQ'
'DISTANCE'
'EDU_LEVEL'
'IMP_JOB'
'IMP_LOG_INCOME'
'LOG_VEHICLE_VAL'
'MVR_PTS'
'M_YOJ'
'REVOKED'
'STATUS'
'VEHICLE_TYPE'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg: Rejected using stepwise selection";
end;
end;

if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE'
'AREA'
'CAR_USE'
'CHILDREN'
'CHILD_DRIV'
'CLAIM_AMOUNT'
'CLAIM_IND'
'CLM_FREQ'
'DISTANCE'
'EDU_LEVEL'
'GENDER'
'HOUSE_VAL'
'INCOME'
'JOB'
'MVR_PTS'
'REVOKED'
'STATE_CODE'
'STATUS'
'VEHICLE_AGE'
'VEHICLE_TYPE'
'VEHICLE_VAL'
'YOJ'
'_DATAOBS_'
) then ROLE='INPUT';
else delete;
end;
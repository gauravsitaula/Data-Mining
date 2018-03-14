if upcase(NAME) = "AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CHILDREN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CLM_FREQ" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "EDU_LEVEL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOUSE_VAL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "INCOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MVR_PTS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_CLAIM_IND0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_CLAIM_IND1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "STATE_CODE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "VEHICLE_AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "VEHICLE_VAL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "YOJ" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;

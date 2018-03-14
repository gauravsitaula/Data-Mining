if upcase(NAME) = "NATURE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_SUBROFLAG0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_SUBROFLAG1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "VEHFLAG" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;

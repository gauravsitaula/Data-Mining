if upcase(NAME) = "BODY" then do;
ROLE = "REJECTED";
end;
else 
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
if upcase(NAME) = "TEXTCLUSTER_SVD1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC_RAW2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC_RAW4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC_RAW5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC_RAW6" then do;
ROLE = "REJECTED";
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

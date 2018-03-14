if upcase(NAME) = "BODY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CAUSE" then do;
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
if upcase(NAME) = "TEXTCLUSTER2_SVD1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD6" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD7" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD8" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD9" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW7" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTTOPIC2_RAW9" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;

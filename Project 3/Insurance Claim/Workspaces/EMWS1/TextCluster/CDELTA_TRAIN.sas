if upcase(NAME) = "TEXTCLUSTER_CLUSTER_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB10" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB11" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB13" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB14" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB15" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB16" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB17" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB18" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB19" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB6" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB7" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB8" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_PROB9" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD1" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD2" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD3" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD4" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER_SVD5" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;

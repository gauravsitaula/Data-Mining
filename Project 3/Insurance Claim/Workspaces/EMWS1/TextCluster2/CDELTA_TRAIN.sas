if upcase(NAME) = "TEXTCLUSTER2_CLUSTER_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB6" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB7" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB8" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_PROB9" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD1" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD10" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD2" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD3" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD4" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD5" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD6" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD7" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD8" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;
else 
if upcase(NAME) = "TEXTCLUSTER2_SVD9" then do;
ROLE = "INPUT";
LEVEL = "INTERVAL";
end;

if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'TEXTCLUSTER_SVD1'
'TEXTCLUSTER_SVD3'
'TEXTTOPIC_RAW3'
'TEXTTOPIC_RAW4'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg: Rejected using stepwise selection";
end;
end;

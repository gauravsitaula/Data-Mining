if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'TEXTCLUSTER4_SVD1'
'TEXTCLUSTER4_SVD10'
'TEXTCLUSTER4_SVD11'
'TEXTCLUSTER4_SVD15'
'TEXTCLUSTER4_SVD21'
'TEXTTOPIC3_RAW1'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg3: Rejected using stepwise selection";
end;
end;

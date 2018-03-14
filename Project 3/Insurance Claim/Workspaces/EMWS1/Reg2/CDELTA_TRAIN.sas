if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'TEXTCLUSTER2_SVD1'
'TEXTCLUSTER2_SVD10'
'TEXTTOPIC2_RAW6'
'TEXTTOPIC2_RAW7'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg2: Rejected using stepwise selection";
end;
end;

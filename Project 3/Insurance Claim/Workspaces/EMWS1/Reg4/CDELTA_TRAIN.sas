if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'BODY'
'CAUSE'
'NATURE'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg4: Rejected using stepwise selection";
end;
end;

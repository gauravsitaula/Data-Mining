label LOG_HOUSE_VAL = 'Transformed: Housing value';
if HOUSE_VAL eq . then LOG_HOUSE_VAL = .;
else do;
if HOUSE_VAL + 1 > 0 then LOG_HOUSE_VAL = log(HOUSE_VAL + 1);
else LOG_HOUSE_VAL = .;
end;

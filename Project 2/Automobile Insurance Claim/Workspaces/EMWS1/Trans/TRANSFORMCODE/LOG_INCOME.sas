label LOG_INCOME = 'Transformed: Income';
if INCOME eq . then LOG_INCOME = .;
else do;
if INCOME + 1 > 0 then LOG_INCOME = log(INCOME + 1);
else LOG_INCOME = .;
end;

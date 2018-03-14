format IMP_AGE 4.0;
label IMP_AGE = 'Imputed: Age';
IMP_AGE = AGE;
if missing(AGE) then IMP_AGE = 53.745808019;

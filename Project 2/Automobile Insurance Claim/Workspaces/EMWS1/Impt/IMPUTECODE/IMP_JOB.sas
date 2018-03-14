length IMP_JOB $13;
format IMP_JOB $13.;
label IMP_JOB = 'Imputed: Occupation of driver';
IMP_JOB = JOB;
if JOB = '' then IMP_JOB = 'Teacher';

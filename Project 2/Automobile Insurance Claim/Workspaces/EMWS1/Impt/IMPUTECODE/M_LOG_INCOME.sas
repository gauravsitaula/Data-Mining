label M_LOG_INCOME = "Imputation Indicator for LOG_INCOME";
if missing(LOG_INCOME) then M_LOG_INCOME = 1;
else M_LOG_INCOME= 0;

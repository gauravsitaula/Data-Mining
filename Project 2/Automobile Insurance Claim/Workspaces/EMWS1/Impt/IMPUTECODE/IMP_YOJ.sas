format IMP_YOJ 4.0;
label IMP_YOJ = 'Imputed: Years on Job';
IMP_YOJ = YOJ;
if missing(YOJ) then IMP_YOJ = 13.45563488;

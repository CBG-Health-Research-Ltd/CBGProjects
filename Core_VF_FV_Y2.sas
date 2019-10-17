
/*core*/
data NZCVSCORE_2019;
set nzcvs.Year2_NZCVSSurvey;
drop SelectedCombo--WT9_06_OTHER DurationInitialDemographics--DurationExitQuestions;
run;


/*modula*/
data NZCVSMODULE_2019;
set nzcvs.Year2_NZCVSSurvey;
*where FV4_01_Intro1 ne .;
keep UUID
			DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVGENDER
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS
			qtr psu2015 nzcvshhid
			WT1_01--WT9_06_OTHER
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 DVPERSONINCOME_imp
DVHHOLDINCOME_imp
;
run;


/*incident dataset*/
/*change the data from 1 HHID per row to 1 incident per row
1 HHID can have mutiple incidents here
*/
data CVF1;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF1 ne .;
keep UUID			DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_1--FV2_11_DKR_1 FinalOffenceCode1 FinalOffenceCode1Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_1;
rename FinalOffenceCode1=FinalOffenceCode 
FinalOffenceCode1Num=FinalOffenceCodeNum
SCN_1=SCN
;
form='CVF1';
run;


data CVF2;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF2 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_2--FV2_11_DKR_2 FinalOffenceCode2 FinalOffenceCode2Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_2;
rename FinalOffenceCode2=FinalOffenceCode 
FinalOffenceCode2Num=FinalOffenceCodeNum
SCN_2=SCN
;
form='CVF2';
run;

data CVF3;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF3 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_3--FV2_11_DKR_3 FinalOffenceCode3 FinalOffenceCode3Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_3;
rename FinalOffenceCode3=FinalOffenceCode 
FinalOffenceCode3Num=FinalOffenceCodeNum
SCN_3=SCN
;
form='CVF3';
run;

data CVF4;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF4 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_4--FV2_11_DKR_4 FinalOffenceCode4 FinalOffenceCode4Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_4;
rename FinalOffenceCode4=FinalOffenceCode 
FinalOffenceCode4Num=FinalOffenceCodeNum
SCN_4=SCN
;
form='CVF4';
run;


data CVF5;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF5 ne .;

keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_5--FV2_11_DKR_5 FinalOffenceCode5 FinalOffenceCode5Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_5;
rename FinalOffenceCode5=FinalOffenceCode 
FinalOffenceCode5Num=FinalOffenceCodeNum
SCN_5=SCN
;
form='CVF5';
run;

data CVF6;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF6 ne .;

keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_6--FV2_11_DKR_6 FinalOffenceCode6 FinalOffenceCode6Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_6; 
rename FinalOffenceCode6=FinalOffenceCode 
FinalOffenceCode6Num=FinalOffenceCodeNum
SCN_6=SCN
;
form='CVF6';
run;

data CVF7;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF7 ne .;

keep UUID			DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_7--FV2_11_DKR_7 FinalOffenceCode7 FinalOffenceCode7Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_7;
rename FinalOffenceCode7=FinalOffenceCode 
FinalOffenceCode7Num=FinalOffenceCodeNum
SCN_7=SCN
;
form='CVF7';
run;

data CVF8;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeCVF8 ne .;

keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_8--FV2_11_DKR_8 FinalOffenceCode8 FinalOffenceCode8Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_8;
rename FinalOffenceCode8=FinalOffenceCode 
FinalOffenceCode8Num=FinalOffenceCodeNum
SCN_8=SCN
;
form='CVF8';
run;


data IVF1;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF1 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_1--VF1_02RemainingIncidents_1 VF3_01_1--VF3_35_DKR_1 FinalOffenceCode1 FinalOffenceCode1Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_1;
rename FinalOffenceCode1=FinalOffenceCode 
FinalOffenceCode1Num=FinalOffenceCodeNum
SCN_1=SCN
;
 
form='IVF1';

run;

data IVF2;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF2 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_2--VF1_02RemainingIncidents_2 VF3_01_2--VF3_35_DKR_2 FinalOffenceCode2 FinalOffenceCode2Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_2;
rename FinalOffenceCode2=FinalOffenceCode 
FinalOffenceCode2Num=FinalOffenceCodeNum
SCN_2=SCN
;
 form='IVF2';


run;


data IVF3;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF3 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_3--VF1_02RemainingIncidents_3 VF3_01_3--VF3_35_DKR_3 FinalOffenceCode3 FinalOffenceCode3Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_3;
rename FinalOffenceCode3=FinalOffenceCode 
FinalOffenceCode3Num=FinalOffenceCodeNum
SCN_3=SCN
;
 form='IVF3';


run;


data IVF4;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF4 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_4--VF1_02RemainingIncidents_4 VF3_01_4--VF3_35_DKR_4 FinalOffenceCode4 FinalOffenceCode4Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_4;
rename FinalOffenceCode4=FinalOffenceCode 
FinalOffenceCode4Num=FinalOffenceCodeNum
SCN_4=SCN
;
 form='IVF4';
run;



data IVF5;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF5 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_5--VF1_02RemainingIncidents_5 VF3_01_5--VF3_35_DKR_5 FinalOffenceCode5 FinalOffenceCode5Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_5;
rename FinalOffenceCode5=FinalOffenceCode 
FinalOffenceCode5Num=FinalOffenceCodeNum
SCN_5=SCN
;
 form='IVF5';
run;

data IVF6;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF6 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_6--VF1_02RemainingIncidents_6 VF3_01_6--VF3_35_DKR_6 FinalOffenceCode6 FinalOffenceCode6Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_6;
rename FinalOffenceCode6=FinalOffenceCode 
FinalOffenceCode6Num=FinalOffenceCodeNum
SCN_6=SCN
;
 form='IVF6';
run;

data IVF7;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF7 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_7--VF1_02RemainingIncidents_7 VF3_01_7--VF3_35_DKR_7 FinalOffenceCode7 FinalOffenceCode7Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_7;
rename FinalOffenceCode7=FinalOffenceCode 
FinalOffenceCode7Num=FinalOffenceCodeNum
SCN_7=SCN
;
 form='IVF7';
run;

data IVF8;
set nzcvs.Year2_NZCVSSurvey;
where FinalOffenceCodeIVF8 ne .;
keep 	UUID		DVURBAN DVREGCOUNCIL
			NZDEPSCORE NZDEPDECILE NZDEPQUINTILE
			DVEVERSEXASSAULT DVEVEROTHASSAULT 
			DVPERSONINCOME DVPERSINCGRP1 DVPERSINCGRP2
			DVHHOLDINCOME DVHHOLDINCGRP1 DVHHOLDINCGRP2
			DVSEX
DVETHN_OTHER DVPERSONINCOME_imp DVHHOLDINCOME_imp 
DVSEXORIENT
DVAGE
DV5YRAGEGRP
DVAGEGRP
DVETHN_EURO
DVETHN_MAORI
DVETHN_PACIFIC
DVETHN_ASIAN
DVETHN_CHINESE
DVETHN_INDIAN
DVETHN_OTHERASIAN
DVETHN_OTHER
DVETHN_NS qtr psu2015 nzcvshhid CurrentVFText_8--VF1_02RemainingIncidents_8 VF3_01_8--VF3_35_DKR_8 FinalOffenceCode8 FinalOffenceCode8Num
hholdweight PersonWeight hholdweight_rep1-hholdweight_rep100 PersonWeight_rep1-PersonWeight_rep100 form SCN_8;
rename FinalOffenceCode8=FinalOffenceCode 
FinalOffenceCode8Num=FinalOffenceCodeNum
SCN_8=SCN
;
 form='IVF8';
run;


/*rename variables to match data dict*/
/*notice lots of CVF and IVF variables were renanmed to the same name. so these variables were merged here*/
%INCLUDE "C:\Documents and Settings\cbg.thomas\My Documents\Program\NZCVS\Year2\VF_RenameY2.sas";

data Year2_NZCVSCVF;
set CVF1 CVF2 CVF3 CVF4 CVF5 CVF6 CVF7 CVF8;
run;

data Year2_NZCVSIVF;
set IVF1 IVF2 IVF3 IVF4 IVF5 IVF6 IVF7 IVF8;
run;

data Year2_NZCVSVFAll;
set Year2_NZCVSCVF Year2_NZCVSIVF;
run;


/*some merged CVF/IVF variable need tweak */
/*merge details in data dict*/
data Year2_NZCVSVFAll;
set Year2_NZCVSVFAll;

/*offnce contact*/
/*set to CVF first*/
DVOFFENCONTCT=OFFENCONTCTS;
DVOFFENCONTCT_DKR=OFFENCONTCTS_DKR;
/*set for IVF*/
if OFFENCONTCT in (1,2) then DVOFFENCONTCT=1;
if OFFENCONTCT = 3 then DVOFFENCONTCT=0;

/*Did you know them (Y/N) VF2_08 (cluster) / VF3_08 (ivf)  / VF3.12 (when more than one person)*/
if STRANG ne . or STRANGS ne . or KNOW_OFFEN ne . or KNOW_OFFEN_DKR ne . then DVKNOW_OFFEN=0;
if KNOW_OFFEN>0 then DVKNOW_OFFEN = KNOW_OFFEN;
if STRANG =2 or STRANGS in (1,2) then DVKNOW_OFFEN=1;
if KNOW_OFFEN_DKR ne . or STRANG=98 or STRANGS=98 then DVKNOW_OFFEN_DKR=98;

/*male VF2_11_1 & VF3_10_1 & VF3_14_1*/
if MALE ne . then DVMALE=MALE;
if PEOPMALEFEM in (1,3) or PERSMALEFEM=1 then DVMALE=1;
if PEOPMALEFEM in (2) or PERSMALEFEM=2 then DVMALE=0;
if MALE_DKR ne . or PEOPMALEFEM =98 or PERSMALEFEM=98 then DVMALE_DKR=98; 
/*female VF2_11_1 & VF3_10_1 & VF3_14_1*/
if FEM ne . then DVFEMALE=FEM;
if PEOPMALEFEM in (1) or PERSMALEFEM=1 then DVFEMALE=0;
if PEOPMALEFEM in (2,3) or PERSMALEFEM=2 then DVFEMALE=1;
if FEM_DKR ne . or PEOPMALEFEM =98 or PERSMALEFEM=98 then DVFEMALE_DKR=98; 

/*change VF3.09 to flags, set default to 0 then assigne value*/
if RELA_HAPEND ne . then do RELA_HUSWFE=0; RELA_PHUSWFE=0; RELA_BOYGRLFRD=0; RELA_PBOYGRLFRD=0; RELA_PARNT=0; RELA_STPPARNT=0; RELA_SIB=0; RELA_SONDAUG=0; RELA_FAM=0;
RELA_PARBOYGRLFRD=0; RELA_FRIEN=0; RELA_FAMFRIEN=0; RELA_FLATM=0; RELA_WRKC=0; RELA_EMPL=0; RELA_NEIG=0; RELA_ACQ=0; RELA_CARE=0; RELA_OTH=0; end;
if RELA_HAPEND=1 then RELA_HUSWFE=1; 
if RELA_HAPEND=2 then RELA_PHUSWFE=1;
if RELA_HAPEND=3 then RELA_BOYGRLFRD=1;
if RELA_HAPEND=4 then RELA_PBOYGRLFRD=1;
if RELA_HAPEND=5 then RELA_PARNT=1;
if RELA_HAPEND=6 then RELA_STPPARNT=1;
if RELA_HAPEND=7 then RELA_SIB=1;
if RELA_HAPEND=8 then RELA_SONDAUG=1;
if RELA_HAPEND=9 then RELA_FAM=1;
if RELA_HAPEND=10 then RELA_PARBOYGRLFRD=1;
if RELA_HAPEND=11 then RELA_FRIEN=1;
if RELA_HAPEND=12 then RELA_FAMFRIEN=1;
if RELA_HAPEND=13 then RELA_FLATM=1;
if RELA_HAPEND=14 then RELA_WRKC=1;
if RELA_HAPEND=15 then RELA_EMPL=1;
if RELA_HAPEND=16 then RELA_NEIG=1;
if RELA_HAPEND=17 then RELA_ACQ=1;
if RELA_HAPEND=18 then RELA_CARE=1;
if RELA_HAPEND=77 then RELA_OTH=1;
if RELA_HAPEND_OTH_VB ne '' then RELA_OTH_VB=RELA_HAPEND_OTH_VB;

/*merge VF2.12 VF3.15*/
if PEOPORDERS=1 or PERSORDERS=1 then HOLDORDER=1;
if PEOPORDERS=2 or PERSORDERS=2 then HOLDORDER=0;
if PEOPORDERS=98 or PERSORDERS=98 then HOLDORDER_DKR=98;

if MVBACK=2 and VFTYPE=2 then MVBACK=0;

/*merge VF3.22 VF2.19*/
if INSCOVER=2 and VFTYPE=2 then INSCOVER=0;
if INSCOVER=98 and VFTYPE=2 then do INSCOVER_DKR=98; INSCOVER=.; end;

/*merge VF3.23 VF2.20*/
if INSCLAIM=2 and VFTYPE=2 then INSCLAIM=0;
if INSCLAIM=98 and VFTYPE=2 then do INSCLAIM_DKR=98; INSCLAIM=.; end;

/*VF2.21 VF3.24*/
DVTIMEOFFW=TIMEOFFW;
DVTIMEOFFW_DKR=TIMEOFFW_DKR;
if OFFW_YESI=1 or OFFW_YESELSE=1 then DVTIMEOFFW=1;
if OFFW_NO=1 then DVTIMEOFFW=0;
if OFFW_DKR=1 then DVTIMEOFFW_DKR=98;

/*merge drug alco*/
if ALCOOFFES ne . then ALCOOFFE=ALCOOFFES;
if DRUGOFFES ne . then DRUGOFFE=DRUGOFFES;
if VFTYPE=2 and ALCOOFFE=2 then ALCOOFFE=0;
if VFTYPE=2 and DRUGOFFE=2 then DRUGOFFE=0;

/*IVF INJURED, set to 0 when it's not yes*/
if INJURED in (2) and VFTYPE=2 then INJURED=0;
if INJURED in (98,99) and VFTYPE=2 then do INJURED=.; INJURED_DKR=INJURED; end;
/*create a full DV version use VF3.34 and VF3.35 when they have value*/
DVINJURED=INJURED;
if INJUREDALL ne . then DVINJURED=INJUREDALL;
DVINJURED_DKR=INJURED_DKR;
if INJUREDALL_DKR ne . then DVINJURED_DKR=INJUREDALL_DKR;

/*IVF police know, set to 0 when it's not yes. VF2.24/VF3.27*/
if POLIFOUN in (2) and VFTYPE=2 then POLIFOUN=0;
if POLIFOUN in (98) and VFTYPE=2 then do POLIFOUN_DKR=98; POLIFOUN=.; end;;
/*create a full DV version use VF3.34 and VF3.35 when they have value*/
DVPOLIFOUN=POLIFOUN;
if POLIFOUNALL ne . then DVPOLIFOUN=POLIFOUNALL;
DVPOLIFOUN_DKR=POLIFOUN_DKR;
if POLIFOUNALL_DKR ne . then DVPOLIFOUN_DKR=POLIFOUNALL_DKR;


/*VF2_28_1 & VF3_31_1*/
if WEAPON=2 and VFTYPE=2 then WEAPON=0;
if WEAPON in (98,99) and VFTYPE=2 then do WEAPON_DKR=WEAPON; WEAPON=.; end;

/*VF2_29_1 & VF3_32_1*/
if SERINCID=2 and VFTYPE=2 then SERINCID=0;
if SERINCID in (98,99) and VFTYPE=2 then do SERINCID_DKR=SERINCID; SERINCID=.; end;

/*FV2_07_1 & FV3_09_1*/
if MEDPROF=2 and VFTYPE=2 then MEDPROF=0;
if MEDPROF in (98,99) and VFTYPE=2 then do MEDPROF_DKR=MEDPROF; MEDPROF=.; end;


/*FV2_11_1 & FV3_13_1*/
if CHILDAWAR=2 and VFTYPE=2 then CHILDAWAR=0;
if CHILDAWAR in (98,99) and VFTYPE=2 then do CHILDAWAR_DKR=CHILDAWAR; CHILDAWAR=.; end;


/*add DV variable from MOJ list*/
if WHEREINCID in (1,2,3,4) then DVPLACEHAPPEN='01';
if WHEREINCID in (5,6,7) then DVPLACEHAPPEN='02';
if WHEREINCID in (8,9,10,11,12,13) then DVPLACEHAPPEN='03';
if WHEREINCID in (14,15,16) then DVPLACEHAPPEN='04';
if WHEREINCID in (17,18) then DVPLACEHAPPEN='05';
if WHEREINCID in (77) then DVPLACEHAPPEN='96';
if WHEREINCID in (98) then DVPLACEHAPPEN='98';

if RELA_HUSWFE=1 or RELA_BOYGRLFRD=1 then DVRELA_PART='1'; else DVRELA_PART = '0';
if OFFENCONTCTS=0 then DVRELA_PART='';
if OFFENCONTCT=3 then DVRELA_PART='';
if STRANG=98 or STRANGS=98 then DVRELA_PART='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_PART='';

if RELA_PHUSWFE=1 or RELA_PBOYGRLFRD=1 then DVRELA_EXPA='1'; else DVRELA_EXPA = '0';
if OFFENCONTCTS=0 then DVRELA_EXPA='';
if OFFENCONTCT=3 then DVRELA_EXPA='';
if STRANG=98 or STRANGS=98 then DVRELA_EXPA='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_EXPA='';

if RELA_PARNT=1 or RELA_STPPARNT=1 or RELA_SIB=1 or RELA_SONDAUG=1 or RELA_FAM=1 or RELA_PARBOYGRLFRD=1 then DVRELA_FAMI='1'; else DVRELA_FAMI = '0';
if OFFENCONTCTS=0 then DVRELA_FAMI='';
if OFFENCONTCT=3 then DVRELA_FAMI='';
if STRANG=98 or STRANGS=98 then DVRELA_FAMI='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_FAMI='';

if RELA_FRIEN=1 or RELA_FAMFRIEN=1 or RELA_FLATM=1 then DVRELA_FRIE='1'; else DVRELA_FRIE = '0';
if OFFENCONTCTS=0 then DVRELA_FRIE='';
if OFFENCONTCT=3 then DVRELA_FRIE='';
if STRANG=98 or STRANGS=98 then DVRELA_FRIE='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_FRIE='';

if RELA_CARE=1 then DVRELA_CARE='1'; else DVRELA_CARE = '0';
if OFFENCONTCTS=0 then DVRELA_CARE='';
if OFFENCONTCT=3 then DVRELA_CARE='';
if STRANG=98 or STRANGS=98 then DVRELA_CARE='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_CARE='';

if RELA_WRKC=1 or RELA_EMPL=1 or RELA_NEIG=1 or RELA_ACQ=1 or RELA_OTH=1 then DVRELA_OTHS='1'; else DVRELA_OTHS = '0';
if OFFENCONTCTS=0 then DVRELA_OTHS='';
if OFFENCONTCT=3 then DVRELA_OTHS='';
if STRANG=98 or STRANGS=98 then DVRELA_OTHS='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_OTHS='';

if KNOW_OFFEN < FinalOffenceCodeNum and KNOW_OFFEN ne . then DVRELA_STRG='1';
else if STRANG=1 or STRANGS=3 then DVRELA_STRG='1';
else DVRELA_STRG='0';
if OFFENCONTCTS=0 then DVRELA_STRG='';
if OFFENCONTCT=3 then DVRELA_STRG='';
if STRANG=98 or STRANGS=98 then DVRELA_STRG='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_STRG='';

if RELA_DKR ne . then DVRELA_NS='1'; else DVRELA_NS = '0';
if OFFENCONTCTS=0 then DVRELA_NS='';
if OFFENCONTCT=3 then DVRELA_NS='';
if STRANG=98 or STRANGS=98 then DVRELA_NS='';
if KNOW_OFFEN=. and VFTYPE=1 then DVRELA_NS='';

if HOLDORDER>0 then DVANYBREACHORDERS = '1'; else DVANYBREACHORDERS='0';

if DISCRACE=1 or DISCSEXLTY=1 or DISCAGE=1 or DISCSEX=1 or DISCRELIG=1 or DISCDISA=1 then DVANYDISCRIMINATION='1'; else DVANYDISCRIMINATION='0';

/*Imputation flag*/
Imputation=0;

drop RELA_HAPEND_OTH_VB RELA_HAPEND ALCOOFFES DRUGOFFES PERSORDERS PEOPORDERS;
run;



/*reorder varaibles based on data dict*/
%INCLUDE "C:\Documents and Settings\cbg.thomas\My Documents\Program\NZCVS\Year2\VF_ReorderY2.sas";

/*add imputation recods*/
data Year2_NZCVSINCIDENTS_2019;
set  Year2_NZCVSVFAll /*nzcvs.nzcvs_impute */;
run;

/*make code 20 into code1 and 2 (create duplicate incidents here)*/
data code1;
set Year2_NZCVSINCIDENTS_2019;
where FinalOffenceCode=20;
FinalOffenceCode=1;
run;
data code2;
set Year2_NZCVSINCIDENTS_2019;
where FinalOffenceCode=20;
FinalOffenceCode=2;
run;


data Year2_NZCVSINCIDENTS_2019_final;
set 
Year2_NZCVSINCIDENTS_2019(where=(FinalOffenceCode ne 20))
code1 
code2;
run;

/*cap 2% for offence number. use min of num and 98% pctl number*/
data incidents_capping_analysis;
set Year2_NZCVSINCIDENTS_2019_final;
run;
proc sort data=incidents_capping_analysis; by FinalOffenceCode; run;


proc freq data=incidents_capping_analysis noprint;
by FinalOffenceCode;
   tables FinalOffenceCodeNum / out=cap;
run;

/*
proc univariate data= incidents_capping_analysis;
var FinalOffenceCodeNum;
by FinalOffenceCode;
   output out=Pctls pctlpts  = 98
                    pctlpre  = ofcn
                    pctlname = pct98;
run;
*/

/*baseed on numbers in proc univariate output dataset cap*/

data Year2_NZCVSINCIDENTS_2019_final;
set Year2_NZCVSINCIDENTS_2019_final;
/*
if FinalOffenceCode=1 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,4);
if FinalOffenceCode=2 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,2);
if FinalOffenceCode=3 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,2);
if FinalOffenceCode=4 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,4);
if FinalOffenceCode=5 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,3);
if FinalOffenceCode=6 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,3);
if FinalOffenceCode=7 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,6);
if FinalOffenceCode=8 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,3);
if FinalOffenceCode=9 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,6);
if FinalOffenceCode=10 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,6);
if FinalOffenceCode=11 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,6);
if FinalOffenceCode=12 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,3);
if FinalOffenceCode=13 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,6);
if FinalOffenceCode=14 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,3);
if FinalOffenceCode=15 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,9);
if FinalOffenceCode=16 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,10);
if FinalOffenceCode=17 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,15);
if FinalOffenceCode=18 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,1);
if FinalOffenceCode=98 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,9);
if FinalOffenceCode=99 then FinalOffenceCodeNum=min(FinalOffenceCodeNum,12);
*/
run;

/*create incident summary varibles*/
data VFSummary;
set Year2_NZCVSINCIDENTS_2019_final;

if FinalOffenceCode=1 then OFFCOD01_INC=FinalOffenceCodeNum;else OFFCOD01_INC=0;
if FinalOffenceCode=2 then OFFCOD02_INC=FinalOffenceCodeNum;else OFFCOD02_INC=0;
if FinalOffenceCode=3 then OFFCOD03_INC=FinalOffenceCodeNum;else OFFCOD03_INC=0;
if FinalOffenceCode=4 then OFFCOD04_INC=FinalOffenceCodeNum;else OFFCOD04_INC=0;
if FinalOffenceCode=5 then OFFCOD05_INC=FinalOffenceCodeNum;else OFFCOD05_INC=0;
if FinalOffenceCode=6 then OFFCOD06_INC=FinalOffenceCodeNum;else OFFCOD06_INC=0;
if FinalOffenceCode=7 then OFFCOD07_INC=FinalOffenceCodeNum;else OFFCOD07_INC=0;
if FinalOffenceCode=8 then OFFCOD08_INC=FinalOffenceCodeNum;else OFFCOD08_INC=0;
if FinalOffenceCode=9 then OFFCOD09_INC=FinalOffenceCodeNum;else OFFCOD09_INC=0;
if FinalOffenceCode=10 then OFFCOD10_INC=FinalOffenceCodeNum;else OFFCOD10_INC=0;
if FinalOffenceCode=11 then OFFCOD11_INC=FinalOffenceCodeNum;else OFFCOD11_INC=0;
if FinalOffenceCode=12 then OFFCOD12_INC=FinalOffenceCodeNum;else OFFCOD12_INC=0;
if FinalOffenceCode=13 then OFFCOD13_INC=FinalOffenceCodeNum;else OFFCOD13_INC=0;
if FinalOffenceCode=14 then OFFCOD14_INC=FinalOffenceCodeNum;else OFFCOD14_INC=0;
if FinalOffenceCode=15 then OFFCOD15_INC=FinalOffenceCodeNum;else OFFCOD15_INC=0;
if FinalOffenceCode=16 then OFFCOD16_INC=FinalOffenceCodeNum;else OFFCOD16_INC=0;
if FinalOffenceCode=17 then OFFCOD17_INC=FinalOffenceCodeNum;else OFFCOD17_INC=0;
if FinalOffenceCode=18 then OFFCOD18_INC=FinalOffenceCodeNum;else OFFCOD18_INC=0;
if FinalOffenceCode=98 then OFFCOD98_INC=FinalOffenceCodeNum;else OFFCOD98_INC=0;
if FinalOffenceCode=99 then OFFCOD99_INC=FinalOffenceCodeNum;else OFFCOD99_INC=0;

/*FV sumamry varibles*/
if FinalOffenceCode in (5 7 8 12 15 16 17) and (DVRELA_PART='1' or DVRELA_EXPA='1'  or DVRELA_FAMI='1') then OFFCODFV_ALL_INC =FinalOffenceCodeNum; else OFFCODFV_ALL_INC=0;
if FinalOffenceCode in (5 7 8 12 15 16 17) and DVRELA_PART='1' then OFFCODFV_PART_INC =FinalOffenceCodeNum; else OFFCODFV_PART_INC=0;
if FinalOffenceCode in (5 7 8 12 15 16 17) and DVRELA_EXPA='1' then OFFCODFV_EXPA_INC =FinalOffenceCodeNum; else OFFCODFV_EXPA_INC=0;
if FinalOffenceCode in (5 7 8 12 15 16 17) and DVRELA_FAMI='1' then OFFCODFV_FAMI_INC =FinalOffenceCodeNum; else OFFCODFV_FAMI_INC=0;

keep qtr psu2015 nzcvshhid OFFCOD01_INC--OFFCODFV_FAMI_INC FinalOffenceCode FinalOffenceCodeNum;
run;

/*get totals for these offence code*/
proc sql;
create table SummaryVariable as 
select qtr,psu2015,nzcvshhid,
sum(OFFCOD01_INC)as OFFCOD01_INC, 
sum(OFFCOD02_INC)as OFFCOD02_INC, 
sum(OFFCOD03_INC)as OFFCOD03_INC, 
sum(OFFCOD04_INC)as OFFCOD04_INC, 
sum(OFFCOD05_INC)as OFFCOD05_INC, 
sum(OFFCOD06_INC)as OFFCOD06_INC, 
sum(OFFCOD07_INC)as OFFCOD07_INC, 
sum(OFFCOD08_INC)as OFFCOD08_INC, 
sum(OFFCOD09_INC)as OFFCOD09_INC, 
sum(OFFCOD10_INC)as OFFCOD10_INC, 
sum(OFFCOD11_INC)as OFFCOD11_INC, 
sum(OFFCOD12_INC)as OFFCOD12_INC, 
sum(OFFCOD13_INC)as OFFCOD13_INC, 
sum(OFFCOD14_INC)as OFFCOD14_INC, 
sum(OFFCOD15_INC)as OFFCOD15_INC, 
sum(OFFCOD16_INC)as OFFCOD16_INC, 
sum(OFFCOD17_INC)as OFFCOD17_INC, 
sum(OFFCOD18_INC)as OFFCOD18_INC,
sum(OFFCOD98_INC)as OFFCOD98_INC,
sum(OFFCOD99_INC)as OFFCOD99_INC,

sum(OFFCODFV_ALL_INC)as OFFCODFV_ALL_INC,
sum(OFFCODFV_PART_INC)as OFFCODFV_PART_INC,
sum(OFFCODFV_EXPA_INC)as OFFCODFV_EXPA_INC,
sum(OFFCODFV_FAMI_INC)as OFFCODFV_FAMI_INC

from VFSummary
group by qtr, psu2015, nzcvshhid;
;
quit;


/*create prevalence flag and add labels*/
data nzcvs.SummaryVariableY2;
set SummaryVariable;
if OFFCOD01_INC >0 then OFFCOD01_PREV=1;else OFFCOD01_PREV=0;
if OFFCOD02_INC >0 then OFFCOD02_PREV=1;else OFFCOD02_PREV=0;
if OFFCOD03_INC >0 then OFFCOD03_PREV=1;else OFFCOD03_PREV=0;
if OFFCOD04_INC >0 then OFFCOD04_PREV=1;else OFFCOD04_PREV=0;
if OFFCOD05_INC >0 then OFFCOD05_PREV=1;else OFFCOD05_PREV=0;
if OFFCOD06_INC >0 then OFFCOD06_PREV=1;else OFFCOD06_PREV=0;
if OFFCOD07_INC >0 then OFFCOD07_PREV=1;else OFFCOD07_PREV=0;
if OFFCOD08_INC >0 then OFFCOD08_PREV=1;else OFFCOD08_PREV=0;
if OFFCOD09_INC >0 then OFFCOD09_PREV=1;else OFFCOD09_PREV=0;
if OFFCOD10_INC >0 then OFFCOD10_PREV=1;else OFFCOD10_PREV=0;
if OFFCOD11_INC >0 then OFFCOD11_PREV=1;else OFFCOD11_PREV=0;
if OFFCOD12_INC >0 then OFFCOD12_PREV=1;else OFFCOD12_PREV=0;
if OFFCOD13_INC >0 then OFFCOD13_PREV=1;else OFFCOD13_PREV=0;
if OFFCOD14_INC >0 then OFFCOD14_PREV=1;else OFFCOD14_PREV=0;
if OFFCOD15_INC >0 then OFFCOD15_PREV=1;else OFFCOD15_PREV=0;
if OFFCOD16_INC >0 then OFFCOD16_PREV=1;else OFFCOD16_PREV=0;
if OFFCOD17_INC >0 then OFFCOD17_PREV=1;else OFFCOD17_PREV=0;
if OFFCOD18_INC >0 then OFFCOD18_PREV=1;else OFFCOD18_PREV=0;
if OFFCOD98_INC >0 then OFFCOD98_PREV=1;else OFFCOD98_PREV=0;
if OFFCOD99_INC >0 then OFFCOD99_PREV=1;else OFFCOD99_PREV=0;

if OFFCODFV_ALL_INC>0 then OFFCODFV_ALL_PREV=1;else OFFCODFV_ALL_PREV=0;
if OFFCODFV_PART_INC>0 then OFFCODFV_PART_PREV=1;else OFFCODFV_PART_PREV=0;
if OFFCODFV_EXPA_INC>0 then OFFCODFV_EXPA_PREV=1;else OFFCODFV_EXPA_PREV=0;
if OFFCODFV_FAMI_INC>0 then OFFCODFV_FAMI_PREV=1;else OFFCODFV_FAMI_PREV=0;

label 
OFFCOD01_PREV='1. Burglary prevalence'
OFFCOD02_PREV='2. Theft of / unlawful takes/converts motor vehicle prevalence'
OFFCOD03_PREV='3. Theft (from motor vehicle) prevalence'
OFFCOD04_PREV='4. Unlawful interference / getting into motor vehicle prevalence'
OFFCOD05_PREV='5. Damage to motor vehicles prevalence'
OFFCOD06_PREV='6. Unlawful takes/converts/interferes with bicycle prevalence'
OFFCOD07_PREV='7. Property damage (household) prevalence'
OFFCOD08_PREV='8. Property damage (personal) prevalence'
OFFCOD09_PREV='9. Theft (except motor vehicles – household) prevalence'
OFFCOD10_PREV='10. Theft (except motor vehicles – personal) prevalence'
OFFCOD11_PREV='11. Trespass prevalence'
OFFCOD12_PREV='12. Robbery prevalence'
OFFCOD13_PREV='13. Fraud and deception prevalence'
OFFCOD14_PREV='14. Cybercrime prevalence'
OFFCOD15_PREV='15. Sexual assault prevalence'
OFFCOD16_PREV='16. Other assault prevalence'
OFFCOD17_PREV='17. Harassment and threatening behaviour prevalence'
OFFCOD18_PREV='18. Other incidents prevalence'
OFFCOD98_PREV='98. Offence not in scope N/A prevalence'
OFFCOD99_PREV='99. Not an offence N/A prevalence'

OFFCOD01_INC='1. Burglary incidence'
OFFCOD02_INC='2. Theft of / unlawful takes/converts motor vehicle incidence'
OFFCOD03_INC='3. Theft (from motor vehicle) incidence'
OFFCOD04_INC='4. Unlawful interference / getting into motor vehicle incidence'
OFFCOD05_INC='5. Damage to motor vehicles incidence'
OFFCOD06_INC='6. Unlawful takes/converts/interferes with bicycle incidence'
OFFCOD07_INC='7. Property damage (household) incidence'
OFFCOD08_INC='8. Property damage (personal) incidence'
OFFCOD09_INC='9. Theft (except motor vehicles – household) incidence'
OFFCOD10_INC='10. Theft (except motor vehicles – personal) incidence'
OFFCOD11_INC='11. Trespass incidence'
OFFCOD12_INC='12. Robbery incidence'
OFFCOD13_INC='13. Fraud and deception incidence'
OFFCOD14_INC='14. Cybercrime incidence'
OFFCOD15_INC='15. Sexual assault incidence'
OFFCOD16_INC='16. Other assault incidence'
OFFCOD17_INC='17. Harassment and threatening behaviour incidence'
OFFCOD18_INC='18. Other incidents incidence'
OFFCOD98_INC='98. Offence not in scope N/A incidence'
OFFCOD99_INC='99. Not an offence N/A incidence'
;
run;

data NZCVSCORE_2019;
merge NZCVSCORE_2019 nzcvs.SummaryVariableY2;
by qtr psu2015 nzcvshhid;
run;

/*Done, set missing to 0*/
data NZCVSCORE_2019;
set NZCVSCORE_2019;
if OFFCOD01_PREV = . then  OFFCOD01_PREV=0;
if OFFCOD02_PREV = . then  OFFCOD02_PREV=0;
if OFFCOD03_PREV = . then  OFFCOD03_PREV=0;
if OFFCOD04_PREV = . then  OFFCOD04_PREV=0;
if OFFCOD05_PREV = . then  OFFCOD05_PREV=0;
if OFFCOD06_PREV = . then  OFFCOD06_PREV=0;
if OFFCOD07_PREV = . then  OFFCOD07_PREV=0;
if OFFCOD08_PREV = . then  OFFCOD08_PREV=0;
if OFFCOD09_PREV = . then  OFFCOD09_PREV=0;
if OFFCOD10_PREV = . then  OFFCOD10_PREV=0;
if OFFCOD11_PREV = . then  OFFCOD11_PREV=0;
if OFFCOD12_PREV = . then  OFFCOD12_PREV=0;
if OFFCOD13_PREV = . then  OFFCOD13_PREV=0;
if OFFCOD14_PREV = . then  OFFCOD14_PREV=0;
if OFFCOD15_PREV = . then  OFFCOD15_PREV=0;
if OFFCOD16_PREV = . then  OFFCOD16_PREV=0;
if OFFCOD17_PREV = . then  OFFCOD17_PREV=0;
if OFFCOD18_PREV = . then  OFFCOD18_PREV=0;
if OFFCOD98_PREV = . then  OFFCOD98_PREV=0;
if OFFCOD99_PREV = . then  OFFCOD99_PREV=0;
if OFFCODFV_ALL_PREV=. then OFFCODFV_ALL_PREV=0;
if OFFCODFV_PART_PREV=. then OFFCODFV_PART_PREV=0;
if OFFCODFV_EXPA_PREV=. then OFFCODFV_EXPA_PREV=0;
if OFFCODFV_FAMI_PREV=. then OFFCODFV_FAMI_PREV=0;

if OFFCOD01_INC = . then OFFCOD01_INC=0;
if OFFCOD02_INC = . then OFFCOD02_INC=0;
if OFFCOD03_INC = . then OFFCOD03_INC=0;
if OFFCOD04_INC = . then OFFCOD04_INC=0;
if OFFCOD05_INC = . then OFFCOD05_INC=0;
if OFFCOD06_INC = . then OFFCOD06_INC=0;
if OFFCOD07_INC = . then OFFCOD07_INC=0;
if OFFCOD08_INC = . then OFFCOD08_INC=0;
if OFFCOD09_INC = . then OFFCOD09_INC=0;
if OFFCOD10_INC = . then OFFCOD10_INC=0;
if OFFCOD11_INC = . then OFFCOD11_INC=0;
if OFFCOD12_INC = . then OFFCOD12_INC=0;
if OFFCOD13_INC = . then OFFCOD13_INC=0;
if OFFCOD14_INC = . then OFFCOD14_INC=0;
if OFFCOD15_INC = . then OFFCOD15_INC=0;
if OFFCOD16_INC = . then OFFCOD16_INC=0;
if OFFCOD17_INC = . then OFFCOD17_INC=0;
if OFFCOD18_INC = . then OFFCOD18_INC=0;
if OFFCOD98_INC = . then OFFCOD98_INC=0;
if OFFCOD99_INC = . then OFFCOD99_INC=0;
if OFFCODFV_ALL_INC=. then OFFCODFV_ALL_INC=0;
if OFFCODFV_PART_INC=. then OFFCODFV_PART_INC=0;
if OFFCODFV_EXPA_INC=. then OFFCODFV_EXPA_INC=0;
if OFFCODFV_FAMI_INC=. then OFFCODFV_FAMI_INC=0;
run;


/*incident*/
data NZCVS.Year2_NZCVSINCIDENTS_2019;
set Year2_NZCVSINCIDENTS_2019_final;
run;

/*core*/
data NZCVS.Year2_NZCVSCORE_2019;
set NZCVSCORE_2019;
run;

/*modula*/
data NZCVS.Year2_NZCVSMODULE_2019;
set NZCVSMODULE_2019;
run;

/*
proc export data=NZCVS.Year2_NZCVSMODULE_2019 outfile="C:\Documents and Settings\cbg.thomas\My Documents\Misc\Year2_NZCVSMODULE_2019.csv" replace;
run;
*/

/*summary varaible shouldnt change
ods html body="check.html"
path="C:\Documents and Settings\cbg.thomas\My Documents\misc"
style=journal;
title 'old ';
proc tabulate  data=nzcvs.Year2_NZCVSCORE_2019_vpn;
var OFFCOD01_INC OFFCOD02_INC OFFCOD03_INC OFFCOD04_INC OFFCOD05_INC OFFCOD06_INC OFFCOD07_INC OFFCOD08_INC;
table OFFCOD01_INC OFFCOD02_INC OFFCOD03_INC OFFCOD04_INC OFFCOD05_INC OFFCOD06_INC OFFCOD07_INC OFFCOD08_INC  ,sum*f=7.0 ;
run;
title 'new';
proc tabulate  data=nzcvs.Year2_NZCVSCORE_2019;
var OFFCOD01_INC OFFCOD02_INC OFFCOD03_INC OFFCOD04_INC OFFCOD05_INC OFFCOD06_INC OFFCOD07_INC OFFCOD08_INC;
table OFFCOD01_INC OFFCOD02_INC OFFCOD03_INC OFFCOD04_INC OFFCOD05_INC OFFCOD06_INC OFFCOD07_INC OFFCOD08_INC  ,sum*f=7.0 ;
run;

ods html close;
*/

/*weights shouldnt change
data vpn;
set NZCVS.year2_nzcvscore_2019_vpn;
keep qtr psu2015 nzcvshhid personweight;
rename personweight=personweight_vpn;
run;

data try;
set  nzcvs.year2_nzcvscore_2019;
keep qtr psu2015 nzcvshhid personweight;
run;

proc sort data = vpn; by psu2015 nzcvshhid;run;

proc sort data = try; by psu2015 nzcvshhid;run;

data try1;
merge vpn(in=in1) try(in=in2);
by  psu2015 nzcvshhid;
if in1 and  in2;
run;

data try1;
set try1;
where  personweight ne personweight_vpn;
diff=abs(personweight-personweight_vpn);
run;
*/


data try1;
set NZCVS.Year2_NZCVSCORE_2019;
run;

data try2;
set NZCVS.Year2_NZCVSINCIDENTS_2019;
run;

data try3;
set NZCVS.Year2_NZCVSMODULE_2019;
run;


data try4;
set NZCVS.Year2_NZCVSINCIDENTS_2019;
where imputation=1;
run;
/*
proc export data=NZCVS.Year2_NZCVSMODULE_2019 outfile="C:\Documents and Settings\cbg.thomas\My Documents\Misc\Year2_NZCVSMODULE_2019.csv" replace;
run;
*/

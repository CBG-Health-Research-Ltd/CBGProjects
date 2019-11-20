

/* CVS selection weight.
PSU prob : provided by Stats NZ

HH prob: 
The probability PrB that a dwelling was selected for the Māori booster sample was:
·	PrB = Pr(PSU selected) x Pr(booster sample dwellings selected / (ER dwellings – ER dwellings in main sample))

As a dwelling that was selected in the booster sample could also have been selected in the main sample the probability any dwelling in the PSU was selected is:
·	main sample (or dwellings enumerated in field): Pr(PSU selected) x PrM
·	booster sample: Pr(PSU selected) x (PrM + PrB).

Occupants prob:
The probability that a respondent was selected was:
·	household with Māori occupant = 1 / (number of Māori occupants)
·	household with no Māori occupants = 1 / (number of occupants).


steps.
1: psu probability from statsNZ
2: hh weight. (different for core and booster)
3: adjust for RR.   HHweight_nonresp = hhweight/rr for each psu
4: hh weight post-stratify by Region
5: get person weight using HHweight_nonresp and occupants probability
6: post-stratify by region age sex. 
7: using previsou weight_ageSex as input post-stratify again for region maori/non-maori
*/


/*file for psu proability*/
PROC IMPORT OUT= psuProbRaw DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\3. NZCVS_PSUSample_Year2.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;

/*selection file for main (it's full sample, but only use for main prob)*/
PROC IMPORT OUT= HHProbMainRaw DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\1. NZCVS Year2 Main Household Sample V2 EP.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;

/*selection file for booster*/
PROC IMPORT OUT= HHProbBoosterRaw DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\NZCVS_Year2_ERDataForSelectionBooster_withHHID_V5.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;

/*
proc sort data = HHProbMainRaw nodupkey; by QTRID MBID HHID; run;
proc sort data = HHProbBoosterRaw nodupkey ; by PSU NZCVSHHID; run;
*/

/***************************************PSU prob***************************************************/
data psuProb;
set psuProbRaw;
rename PSU=PSU2015 probability_selection=PSUProb;
keep PSU probability_selection;
run;

/***************************************HH prob***************************************************/
/*HH prob for main*/
/*set booster to unselected first to get the correct core probabiliy*/
data HHProbMainClean;
set HHProbMainRaw;
if Sub_Sample_Type='S' then Selected=0;
run;

proc sql;
create table HHProbMain as
select MBID,HHID,Selected,count(Selected) as TotalHH, sum(Selected) as SelectedHH
from HHProbMainClean
group by MBID;
quit;

data HHProbMain;
set HHProbMain;
rename MBID = PSU2015 HHID=NZCVSHHID;
PrM=SelectedHH/TotalHH;
run;

/*HH prob for Booster*/
proc sql;
create table HHProbBooster as
select PSU,NZCVSHHID,Selected,count(Selected) as TotalHH, sum(Selected) as SelectedHH
from HHProbBoosterRaw
group by PSU;
quit;

data HHProbBooster;
set HHProbBooster;
rename PSU = PSU2015 ;
PrB=SelectedHH/TotalHH;
if Selected=1 then SampleType='S';
run;
proc sort data=HHProbMain; by PSU2015 NZCVSHHID; run;
proc sort data=HHProbBooster; by PSU2015 NZCVSHHID; run;

/*combine main and booster*/
data SelectedHH;
merge HHProbBooster HHProbMain;
by PSU2015 NZCVSHHID;
run;

data SelectedHH;
set SelectedHH;
/*set back booster selected sample */
if SampleType='S' then Selected=1;
if SampleType ne 'S' then SampleType='C';
/*get HH prob*/
if SampleType='C' then HHprob=PrM;
if SampleType='S' then HHprob=(1-PrM)*PrB;
run;

data SelectedHH;
set SelectedHH;
where Selected=1;
*drop PrM PrB SampleType;
run;
/*11578 selected, quick check, in full sample we should have 11578 selected as well*/



/*
data check;
set HHProbMainRaw;
where Selected=1;
rename MBID = PSU2015 HHID=NZCVSHHID;
run;
*/
/*yes 11578*/

/*sort and quick check: we should not have any duplicate id in selected hh*/
/*proc sort data = SelectedHH nodupkey; by PSU2015 NZCVSHHID; run;*/
/*yes no duplicate*/

/*all have total HH, prm,prb when type=S*/
/*
data check;
set SelectedHH; 
where TotalHH=. or SelectedHH=. or PrM=.;
run;

data check;
set SelectedHH; 
where SampleType='S' and  Prb=.;
run;
*/

/***********************************Occupants prob*****************************************/

proc sort data= NZCVS.Nzcvsoccupants; by PSU2015 NZCVSHHID; run;


proc sql;
create table occProb as
select PSU2015,NZCVSHHID,count(maori) as TotalOcc, sum(maori) as MaoriOcc, sum(Reselection) as ReselectionN
from NZCVS.Nzcvsoccupants
group by PSU2015, NZCVSHHID;
quit;

/*
·	household with Māori occupant = 1 / (number of Māori occupants)
·	household with no Māori occupants = 1 / (number of occupants).
*/

data occProb;
set occProb;
if MaoriOcc=0 then OccProb=1/TotalOcc;
if MaoriOcc>0 then OccProb=1/MaoriOcc;
/*surveyor can do re-selection*/
if ReselectionN>0 then OccProb=1/TotalOcc;
run;

/*quick check, do we have mixed household but selected non-maori person (and not re-selection)*/
/*
data check;
set occProb;
where MaoriOcc ne TotalOcc and MaoriOcc>0 and ReselectionN=.;
run;

data check;
merge check(in=in1) NZCVS.Nzcvsoccupants;
by psu2015 nzcvshhid;
if in1;
run;

data check;
set check;
where maori=0 and selected=1;
run;
*/
/*0 obs, all good*/




/*******************post-stratify household weight by region***********************/
/*file for number of HH, breakdown by region*/
PROC IMPORT OUT= Regional_Households_30June2019 DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\Regional_Households_30June2019.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;
data Regional_Households_30June2019;
set Regional_Households_30June2019;
where RegionNew ne .;
drop D;
run;

data combo;
set nzcvs2.nzcvscombo;
where qtr in (3,4,5,6);
run;

proc sort data = combo(keep=psu2015 PSUResponseRate Region2015) nodupkey out=PSUResponseRate; by psu2015; run;
proc sort data = SelectedHH; by psu2015; run;
proc sort data = psuProb; by psu2015; run;

data HHWeight;
merge psuProb SelectedHH(in=in1) PSUResponseRate;
by psu2015;
if in1 ;
run;

proc sort data =HHWeight nodupkey; by psu2015 nzcvshhid; run;

/*RR adjust HH weights*/
data HHWeight;
set HHWeight;
HHprobAll =HHprob*PSUProb;
HHWeight = 1/HHprobAll;
if PSUResponseRate not in (.,0) then HHweight_nonresp = hhweight  / PSUResponseRate; else HHweight_nonresp=0;
run;


proc sort data =HHWeight; by psu2015; run;
/*add replicate group 1-100*/
data HHWeight;
set HHWeight;
by psu2015;
retain repgrp 0 ;
if first.psu2015 then repgrp = mod(repgrp, 100) + 1 ;
run;

/*calibration hh weights by region*/
%INCLUDE "C:\Documents and Settings\cbg.thomas\My Documents\Program\NZCVS\Gregwt.sas";

data calibrationweightsHH;
set HHWeight;
RegionNew=Region2015;
/*merge Marlborough +   Tasman + Nelson, coded as 98*/
if Region2015 in (16,17,18) then RegionNew=98;
keep psu2015 nzcvshhid HHweight_nonresp RegionNew repgrp;
run;

data complete;
set nzcvs2.nzcvscombo;
where  OutcomeMoJ='INTCOM' and qtr in (3,4,5,6); 
keep psu2015 nzcvshhid;
run;

proc sort data =calibrationweightsHH; by  psu2015 nzcvshhid; run;
proc sort data =complete; by  psu2015 nzcvshhid; run;

data calibrationweightsHH;
merge calibrationweightsHH(in=in1) complete(in=in2);
if in1 and in2;
by  psu2015 nzcvshhid; 
run;

proc sort data= calibrationweightsHH;  by repgrp; run;

/*HH replicate weights*/
%GREGWT(
UNITDSN=calibrationweightsHH, 
OUTDSN=calibrationweightsHH_result,
INWEIGHT=HHweight_nonresp, 
WEIGHT=HHWeight_Region,
B1DSN=Regional_Households_30June2019, 
B1CLASS=RegionNew,
B1TOT=pop,
ID=_ALL_,
REPID=REPGRP
);

data calibrationweightsHH_result;
set calibrationweightsHH_result;
rename 
rwt1=hholdweight_rep1
rwt2=hholdweight_rep2
rwt3=hholdweight_rep3
rwt4=hholdweight_rep4
rwt5=hholdweight_rep5
rwt6=hholdweight_rep6
rwt7=hholdweight_rep7
rwt8=hholdweight_rep8
rwt9=hholdweight_rep9
rwt10=hholdweight_rep10
rwt11=hholdweight_rep11
rwt12=hholdweight_rep12
rwt13=hholdweight_rep13
rwt14=hholdweight_rep14
rwt15=hholdweight_rep15
rwt16=hholdweight_rep16
rwt17=hholdweight_rep17
rwt18=hholdweight_rep18
rwt19=hholdweight_rep19
rwt20=hholdweight_rep20
rwt21=hholdweight_rep21
rwt22=hholdweight_rep22
rwt23=hholdweight_rep23
rwt24=hholdweight_rep24
rwt25=hholdweight_rep25
rwt26=hholdweight_rep26
rwt27=hholdweight_rep27
rwt28=hholdweight_rep28
rwt29=hholdweight_rep29
rwt30=hholdweight_rep30
rwt31=hholdweight_rep31
rwt32=hholdweight_rep32
rwt33=hholdweight_rep33
rwt34=hholdweight_rep34
rwt35=hholdweight_rep35
rwt36=hholdweight_rep36
rwt37=hholdweight_rep37
rwt38=hholdweight_rep38
rwt39=hholdweight_rep39
rwt40=hholdweight_rep40
rwt41=hholdweight_rep41
rwt42=hholdweight_rep42
rwt43=hholdweight_rep43
rwt44=hholdweight_rep44
rwt45=hholdweight_rep45
rwt46=hholdweight_rep46
rwt47=hholdweight_rep47
rwt48=hholdweight_rep48
rwt49=hholdweight_rep49
rwt50=hholdweight_rep50
rwt51=hholdweight_rep51
rwt52=hholdweight_rep52
rwt53=hholdweight_rep53
rwt54=hholdweight_rep54
rwt55=hholdweight_rep55
rwt56=hholdweight_rep56
rwt57=hholdweight_rep57
rwt58=hholdweight_rep58
rwt59=hholdweight_rep59
rwt60=hholdweight_rep60
rwt61=hholdweight_rep61
rwt62=hholdweight_rep62
rwt63=hholdweight_rep63
rwt64=hholdweight_rep64
rwt65=hholdweight_rep65
rwt66=hholdweight_rep66
rwt67=hholdweight_rep67
rwt68=hholdweight_rep68
rwt69=hholdweight_rep69
rwt70=hholdweight_rep70
rwt71=hholdweight_rep71
rwt72=hholdweight_rep72
rwt73=hholdweight_rep73
rwt74=hholdweight_rep74
rwt75=hholdweight_rep75
rwt76=hholdweight_rep76
rwt77=hholdweight_rep77
rwt78=hholdweight_rep78
rwt79=hholdweight_rep79
rwt80=hholdweight_rep80
rwt81=hholdweight_rep81
rwt82=hholdweight_rep82
rwt83=hholdweight_rep83
rwt84=hholdweight_rep84
rwt85=hholdweight_rep85
rwt86=hholdweight_rep86
rwt87=hholdweight_rep87
rwt88=hholdweight_rep88
rwt89=hholdweight_rep89
rwt90=hholdweight_rep90
rwt91=hholdweight_rep91
rwt92=hholdweight_rep92
rwt93=hholdweight_rep93
rwt94=hholdweight_rep94
rwt95=hholdweight_rep95
rwt96=hholdweight_rep96
rwt97=hholdweight_rep97
rwt98=hholdweight_rep98
rwt99=hholdweight_rep99
rwt100=hholdweight_rep100

;
run;

proc sort data= calibrationweightsHH_result;by psu2015 nzcvshhid;run;

data HHWeightFinal;
merge HHWeight calibrationweightsHH_result(keep=psu2015 nzcvshhid HHWeight_Region RegionNew hholdweight_rep1-hholdweight_rep100);
by psu2015 nzcvshhid;
run;


/*******************post-stratify person weight by age sex maori***********************/
data selectionWeight;
merge HHWeightFinal occProb;
by psu2015 nzcvshhid;
run;



data selectionWeight;
set selectionWeight;
if OccProb ne . then SelectionProb= (1/HHweight_nonresp)*OccProb;
SelectionWeight=1/SelectionProb;
run;


/* file population number age sex breakdown by region*/
PROC IMPORT OUT= Regional_Age_Sex_30June2019 DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\Regional_Age_Sex_30June2019.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;
data Regional_Age_Sex_30June2019;
set Regional_Age_Sex_30June2019;
where AgeGroup not in ('Total','0-14');
run;


data responder;
set NZCVS.Nzcvsoccupants;
where selected=1;

Select;
when (age >=15 and age <=39)  AgeGroup='15-39';
when (age >=40 and age <=64)  AgeGroup='40-64';
when (age >= 65)  AgeGroup='65+';
otherwise AgeGroup='error';
end;

keep qtr psu2015 nzcvshhid EthnicityMO selected Age sex AgeGroup;
run;

proc sort data = responder nodupkey; by psu2015 nzcvshhid; run;


/*check agegroup*/
/*
data check;
set responder;
where AgeGroup='error';
run;
*/
/*0 obs all good*/


data selectionWeight;
merge selectionWeight(in=in1) responder;
by psu2015 nzcvshhid;
if in1;
run;


proc sort data = selectionWeight; by psu2015 nzcvshhid; run;

data age_sex;
set selectionWeight;
keep  psu2015 nzcvshhid SelectionWeight AgeGroup sex Region2015;
run;


data age_sex;
merge age_sex(in=in1) complete(in=in2);
if in1 and in2;
by  psu2015 nzcvshhid; 
run;

/*check age gender
data try;
set age_sex;
where Region2015=. or Sex='' or agegroup='';
run;

6 record missing


data try;
set nzcvs.Year2_NZCVSSurvey;
where nzcvshhid in ('A0295568','A1162285','A3063580','A0947597','A1070361','A1589512');
keep nzcvshhid ID1_01 ID1_02;
run;

check suvey data and patch*/
data age_sex;
set age_sex;
if nzcvshhid='A1162285' then do sex='M';agegroup='15-39'; end;
if nzcvshhid='A1070361' then do sex='F';agegroup='65+'; end;
if nzcvshhid='A1589512' then do sex='M';agegroup='40-64'; end;
if nzcvshhid='A0947597' then do sex='F';agegroup='15-39'; end;
if nzcvshhid='A0295568' then do sex='M';agegroup='40-64'; end;
if nzcvshhid='A3063580' then do sex='M';agegroup='40-64'; end;
run; 


%GREGWT(
UNITDSN=age_sex, 
OUTDSN=age_sex_result,
INWEIGHT=SelectionWeight, 
WEIGHT=SelectionWeight_AgeSex,
B1DSN=Regional_Age_Sex_30June2019, 
B1CLASS=Region2015 Sex agegroup,
B1TOT=pop,
ID=_ALL_
);


data selectionWeight;
merge selectionWeight age_sex_result;
by psu2015 nzcvshhid;
run;

/* file population number maori non-maori breakdown by region*/
PROC IMPORT OUT= Regional_Maori_30June2019 DATAFILE= "C:\Documents and Settings\cbg.thomas\My Documents\data\NZCVS\Regional_Maori_30June2019.xlsx"
            DBMS=xlsx REPLACE;		
     GETNAMES=YES;
RUN;

data maori;
set selectionWeight;
where SelectionWeight_AgeSex > 0;
keep psu2015 nzcvshhid SelectionWeight_AgeSex  Region2015 EthnicityMO repgrp;
run;

/*check eth
data check;
set maori;
where EthnicityMO='';
run;

6 people miss eth. checked survey eth, all 'O'
*/

/*patch 6 missing*/
data maori;
set maori;
if EthnicityMO='' then EthnicityMO='O';
run;

data maori;
merge maori(in=in1) complete(in=in2);
if in1 and in2;
by  psu2015 nzcvshhid; 
run;


proc sort data= maori;  by repgrp; run;

/*replicate wegiht*/
%GREGWT(
UNITDSN=maori,
OUTDSN=maori_result,
INWEIGHT=SelectionWeight_AgeSex,
WEIGHT=PERSONWEIGHT,
B1DSN=Regional_Maori_30June2019,
B1CLASS=Region2015 EthnicityMO,
B1TOT=pop,
ID=_ALL_,
REPID=REPGRP
);


data maori_result;
set maori_result;
rename 
rwt1=personweight_rep1
rwt2=personweight_rep2
rwt3=personweight_rep3
rwt4=personweight_rep4
rwt5=personweight_rep5
rwt6=personweight_rep6
rwt7=personweight_rep7
rwt8=personweight_rep8
rwt9=personweight_rep9
rwt10=personweight_rep10
rwt11=personweight_rep11
rwt12=personweight_rep12
rwt13=personweight_rep13
rwt14=personweight_rep14
rwt15=personweight_rep15
rwt16=personweight_rep16
rwt17=personweight_rep17
rwt18=personweight_rep18
rwt19=personweight_rep19
rwt20=personweight_rep20
rwt21=personweight_rep21
rwt22=personweight_rep22
rwt23=personweight_rep23
rwt24=personweight_rep24
rwt25=personweight_rep25
rwt26=personweight_rep26
rwt27=personweight_rep27
rwt28=personweight_rep28
rwt29=personweight_rep29
rwt30=personweight_rep30
rwt31=personweight_rep31
rwt32=personweight_rep32
rwt33=personweight_rep33
rwt34=personweight_rep34
rwt35=personweight_rep35
rwt36=personweight_rep36
rwt37=personweight_rep37
rwt38=personweight_rep38
rwt39=personweight_rep39
rwt40=personweight_rep40
rwt41=personweight_rep41
rwt42=personweight_rep42
rwt43=personweight_rep43
rwt44=personweight_rep44
rwt45=personweight_rep45
rwt46=personweight_rep46
rwt47=personweight_rep47
rwt48=personweight_rep48
rwt49=personweight_rep49
rwt50=personweight_rep50
rwt51=personweight_rep51
rwt52=personweight_rep52
rwt53=personweight_rep53
rwt54=personweight_rep54
rwt55=personweight_rep55
rwt56=personweight_rep56
rwt57=personweight_rep57
rwt58=personweight_rep58
rwt59=personweight_rep59
rwt60=personweight_rep60
rwt61=personweight_rep61
rwt62=personweight_rep62
rwt63=personweight_rep63
rwt64=personweight_rep64
rwt65=personweight_rep65
rwt66=personweight_rep66
rwt67=personweight_rep67
rwt68=personweight_rep68
rwt69=personweight_rep69
rwt70=personweight_rep70
rwt71=personweight_rep71
rwt72=personweight_rep72
rwt73=personweight_rep73
rwt74=personweight_rep74
rwt75=personweight_rep75
rwt76=personweight_rep76
rwt77=personweight_rep77
rwt78=personweight_rep78
rwt79=personweight_rep79
rwt80=personweight_rep80
rwt81=personweight_rep81
rwt82=personweight_rep82
rwt83=personweight_rep83
rwt84=personweight_rep84
rwt85=personweight_rep85
rwt86=personweight_rep86
rwt87=personweight_rep87
rwt88=personweight_rep88
rwt89=personweight_rep89
rwt90=personweight_rep90
rwt91=personweight_rep91
rwt92=personweight_rep92
rwt93=personweight_rep93
rwt94=personweight_rep94
rwt95=personweight_rep95
rwt96=personweight_rep96
rwt97=personweight_rep97
rwt98=personweight_rep98
rwt99=personweight_rep99
rwt100=personweight_rep100

;
run;

proc sort data = maori_result; by psu2015 nzcvshhid; run;

/*done.
HHWeight: raw HH weight.
HHweight_nonresp: HH weight adjusted by RR
hholdweight: HH weight post-stratify by region
SelectionWeight: person weight (HH weight is adjusted by RR)
SelectionWeight_AgeSex: person weight post-stratify by region sex age
PersonWeight: person weight post-stratify by maori/non-maori (SelectionWeight_AgeSex as input)
hholdweight_rep1-100: replicate household weights
PersonWeight_rep1-100: replicate person weights.
*/
data SelectionWeight;
merge selectionWeight maori_result;
by psu2015 nzcvshhid;
run;

data nzcvs.SelectionWeightYear2;
set SelectionWeight;
rename HHWeight_Region=hholdweight;
run;




/*check complete surveys all have weight*/
/*
data combo;
set nzcvs2.nzcvscombo;
keep qtr psu2015 nzcvshhid outcomeMOJ;
where outcomeMOJ='INTCOM' and qtr in (3,4,5,6);
run;

proc sort data = combo; by psu2015 nzcvshhid; run;

data check;
merge nzcvs.SelectionWeightYear2 combo(in=in1);
by psu2015 nzcvshhid;
if in1;
run;

data check;
set check;
where SelectionWeight=. or PersonWeight=. or hholdweight=.;
keep qtr psu2015 nzcvshhid SelectionWeight HHWeight OccProb SelectedHH TotalHH PSUProb;
run;
*/
/*0 obs all good*/

/*
data try;
set NZCVS1.Nzcvsoccupants;
where nzcvshhid in ('A0661885','A1414782','A0557859','A2264325','A1271068','A0451636','A0411301');
run;

data try;
set check;
where TotalHH=.;
keep qtr psu2015 nzcvshhid SelectionWeight HHWeight OccProb SelectedHH TotalHH PSUProb type;
run;


proc export data=try outfile="C:\Documents and Settings\cbg.thomas\My Documents\Misc\MissingHHWeight.csv" replace;
run;
*/
/*check weights sum*/

/*
ods html body="check_weights.html"
path="C:\Documents and Settings\cbg.thomas\My Documents\misc"
style=journal;
title 'check_hh_region';
proc tabulate data=  nzcvs.SelectionWeightYear2;
class regionNew;
var hholdweight;
table regionNew all,hholdweight*sum;
run;

title 'SelectionWeight_AgeSex';
proc tabulate data=  nzcvs.SelectionWeightYear2;
class region2015 sex agegroup;
var SelectionWeight_AgeSex ;
table region2015*agegroup*sex all,SelectionWeight_AgeSex*sum;
run;

title 'SelectionWeight_Maori';
proc tabulate data=  nzcvs.SelectionWeightYear2;
class Region2015 EthnicityMO;
var PersonWeight ;
table Region2015*EthnicityMO all,PersonWeight*sum;
run;
ods html close;

*/
/*all weights match pop total*/

/*
ods html body="check_weights_total.html"
path="C:\Documents and Settings\cbg.thomas\My Documents\misc"
style=journal;
title 'check_hh_region';
proc tabulate data=  nzcvs.SelectionWeightYear2;
var hholdweight;
table hholdweight*sum;
run;

title 'SelectionWeight_AgeSex';
proc tabulate data=  nzcvs.SelectionWeightYear2;
var SelectionWeight_AgeSex ;
table SelectionWeight_AgeSex*sum;
run;

title 'SelectionWeight_Maori';
proc tabulate data=  nzcvs.SelectionWeightYear2;
var PersonWeight ;
table PersonWeight*sum;
run;
ods html close;
*/


data try;
set nzcvs.SelectionWeightYear2;
where EthnicityMO not in ('M','O') and PersonWeight ne .;
keep nzcvshhid EthnicityMO Region2015 PersonWeight;
run;




data try1;
set nzcvs2.nzcvscombo;
where nzcvshhid in ('A0295568','A1162285','A3063580','A0947597','A1070361','A1589512');
run;

---FIRST CSV FILE
IPLsummary0= LOAD '/Users/miteshajadhav/Documents/IPLData/all_season_summary.csv' USING PigStorage(',');

foreach_Summary = FOREACH IPLsummary0 GENERATE $01 as id, $3 as short_name, $12 as winner;
--DUMP foreach_summary;

--SPLITING DATA
SPLIT foreach_Summary into foreach_Summary1 if id >1237177, foreach_Summary2 if id <= 419146;

--DUMP foreach_Summary1;
DUMP foreach_Summary2;
DUMP foreach_Summary1;

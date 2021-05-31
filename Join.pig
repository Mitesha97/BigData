---FIRST CSV FILE
IPLsummary= LOAD '/Users/miteshajadhav/Documents/IPLData/all_season_summary.csv ' USING PigStorage(',');

foreach_summary = FOREACH IPLsummary GENERATE $01 as id, $3 as short_name,  $12 as winner;
--DUMP foreach_summary;

---SECOND CSV FILE
IPLBatting= LOAD '/Users/miteshajadhav/Documents/IPLData/all_season_batting_card.csv ' USING PigStorage(',');

foreach_batting= FOREACH IPLBatting GENERATE $01 as id, $5 as venue, $7 as country;
--DUMP foreach_batting;

--INNER JOIN
Join_IPL = JOIN foreach_summary BY id, foreach_batting BY id;
IPL_data = LIMIT Join_IPL 35;
DUMP IPL_data;

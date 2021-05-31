IPLCity= LOAD '/Users/miteshajadhav/Documents/IPLData/all_season_bowling_card.csv ' USING PigStorage(',');
--DUMP IPLCity;

foreach_City = FOREACH IPLCity GENERATE $0 as season, $2 as match_name,  $7 as city,  $8 as country;
--DUMP foreach_City;

filter_Season= FILTER foreach_City BY season=='2020';

Group_City = GROUP filter_Season BY city;
limit_data = LIMIT Group_City 1;
DUMP limit_data;

--filter_City= FILTER limit_data BY match_name == 'SRH v KXIP';
--DUMP filter_City;

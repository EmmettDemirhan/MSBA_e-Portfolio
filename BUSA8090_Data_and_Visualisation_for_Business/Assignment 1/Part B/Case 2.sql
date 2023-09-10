use easy_care_gardening;


--
-- How to make a team of the available volunteers for the first case 
--
-- Once we have the list of available volunteers on Tuesday first half of the morning,
--  we will run a insert query in “teams” table with volunteer id whom you want to add in team with name of new team.

INSERT INTO `teams` (`team_name`, `volunteers`, `updated_at`, `created_at`) 
VALUES ('Team B', '14,15,19,22', current_timestamp(), current_timestamp());
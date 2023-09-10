use easy_care_gardening;

--
-- How to assign the team to any client with  a newly formed team in the second case
--

INSERT INTO `team_client` (`client_id`, `team_id`, `volunteers`, `start_date`, `end_date`, `updated_at`, `created_at`) 
VALUES ('43', '23', '14,15,19,22', '2022-09-27', '2022-09-28', current_timestamp(), current_timestamp());
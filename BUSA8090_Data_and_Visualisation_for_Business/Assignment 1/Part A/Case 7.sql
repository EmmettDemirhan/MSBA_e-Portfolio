use easy_care_gardening;

--
-- How to list a team and their volunteers
--

select `teams`.`team_name` as `teamName`, GROUP_CONCAT(volunteers.given_name) 
as volunteerName from `teams` left join `volunteers` 
on FIND_IN_SET(volunteers.id,teams.volunteers) > '0' group by `teams`.`id`;
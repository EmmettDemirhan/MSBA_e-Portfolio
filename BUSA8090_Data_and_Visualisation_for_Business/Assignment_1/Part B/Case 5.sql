use easy_care_gardening;

--
-- How to show the name of volunteers assigned in the team
--
-- For getting the list of all teams with their team id, team name and volunteer id, 
-- we can run this below mentioned query:

select `teams`.`id` as `teamId`, `teams`.`team_name` as `teamName`, `teams`.`volunteers` 
as `VolunteersIDs`, GROUP_CONCAT(volunteers.given_name) as volunteerName from `teams` 
left join `volunteers` on FIND_IN_SET(volunteers.id,teams.volunteers) > '0' group by `teams`.`id`;
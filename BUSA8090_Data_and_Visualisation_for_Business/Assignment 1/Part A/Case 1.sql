use easy_care_gardening;

--
-- How to find the details of volunteer who is available on 25th Oct’22 in the morning
--
-- Firstly we will manually search the day of given date, in our case its ‘tuesday’. 
-- Once we find the day we will put this day in below sql query:

select `volunteers`.`id` as `volunteerId`, `volunteers`.`given_name` as 
`volunteerName`, `volunteers`.`family_name` as `volunteerFamilyname`, 
`volunteers`.`mobile` as `volunteerMobile`, `volunteers`.`email`
as `volunteerEmail`,`volunteers`.`address` as `volunteerAddress` from `availability` 
inner join `volunteers` on `availability`.`volunteer_id` = `volunteers`.`id` 
where `availability`.`half_day_morning` = 1 and `availability`.`tuesday` = 1;
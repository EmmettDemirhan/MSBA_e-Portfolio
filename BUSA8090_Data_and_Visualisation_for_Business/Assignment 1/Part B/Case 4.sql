use easy_care_gardening;

--
-- How to get list all the registered volunteers
--
-- For getting the list of all registered volunteers, run the following query:



SELECT `volunteers`.`id` as `volunteerId`, `volunteers`.`given_name` as `volunteerName`, `volunteers`.`family_name` 
as `volunteerFamilyName`, `volunteers`.`address` as `volunteerAddress`, `volunteers`.`mobile` 
as `volunteerMobile`, `volunteers`.`email` as `volunteerEmail` FROM `volunteers`;
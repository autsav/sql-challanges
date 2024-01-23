-- Question #4: 
-- Count how many attendees each type of offsite has had over the last few years. Create the following offsite categories:
-- 1. Drinks
-- 2. Laser tag
-- 3. Tennis
-- 4. Mario Kart
-- 5. Bubble Football
-- 6. In case there are activities missing, populate the column with “No Offsite Activity” to make sure all columns are populated.

-- Make sure to clean up the data!


SELECT CASE WHEN offsite_activity LIKE '%Drinks%' THEN 'Drinks'
						WHEN offsite_activity IN ('Tennis', 'Mario Kart Tournament') THEN offsite_activity
            WHEN REGEXP_LIKE(offsite_activity, 'laser|lazer|tag', 'i') THEN 'Laser tag'
            WHEN REGEXP_LIKE(offsite_activity, 'Football', 'i') THEN 'Bubble Football'
						WHEN offsite_activity = '' THEN 'No Offsite Activity'
       			ELSE 'Error'     
       END AS offsite_category,
       COUNT(*) AS num_attendees


FROM meta_employees employees
		 LEFT JOIN meta_offsites offsites ON employees.sales_team = offsites.sales_team

GROUP BY offsite_category
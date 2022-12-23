SELECT *
FROM backers;

-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT (cf_id),backers_count 
FROM campaign
WHERE (outcome = 'live')
GROUP BY "cf_id"
ORDER by "backers_count" DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT cf_id, COUNT(backer_id)
FROM backers
GROUP BY "cf_id"
ORDER by "count" DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT cm.cf_id, cm.outcome, (cm.goal - cm.pledged) as remaining_goal, bk.first_name, bk.last_name, bk.email
INTO email_contacts_remaining_goal_amount
FROM 
campaign as cm
JOIN 
backers as bk
ON cm.cf_id = bk.cf_id
WHERE (cm.outcome = 'live')
ORDER BY "remaining_goal" DESC;

-- Check the table
SELECT *
FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.email, bk.first_name, bk.last_name, cm.cf_id, cm.company_name, cm.description, cm.end_date, cm.goal - cm.pledged as left_of_goal
INTO email_backers_remaining_goal_amount
FROM 
campaign as cm
JOIN 
backers as bk
ON cm.cf_id = bk.cf_id
WHERE (cm.outcome = 'live')
ORDER BY "last_name","email";


-- Check the table
SELECT *
FROM email_backers_remaining_goal_amount



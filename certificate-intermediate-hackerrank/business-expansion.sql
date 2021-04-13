--Problem Statement
/*
Business Expansion
 */
--Solution

SELECT contact.user_account_id,
user_account.first_name,
user_account.last_name,
contact.customer_id,
customer.customer_name,
count(*) as numbers
FROM contact as contact
JOIN user_account as user_account
ON contact.user_account_id = user_account.id
JOIN customer as customer
ON contact.customer_id = customer.id
WHERE (contact.user_account_id, contact.customer_id) IN (
    SELECT user_account_id, customer_id FROM contact GROUP BY user_account_id, customer_id HAVING count(*) > 1
)
GROUP BY contact.user_account_id ,contact.customer_id, user_account.first_name, user_account.last_name, customer.customer_name



OR

SELECT contact.user_account_id,
user_account.first_name,
user_account.last_name,
contact.customer_id,
customer.customer_name,
SUM(CASE WHEN contact.user_account_id IS NOT NULL THEN 1 ELSE 0 END) AS numers
FROM contact as contact
JOIN user_account as user_account
ON contact.user_account_id = user_account.id
JOIN customer as customer
ON contact.customer_id = customer.id
WHERE (contact.user_account_id, contact.customer_id) IN (
    SELECT user_account_id, customer_id FROM contact GROUP BY user_account_id, customer_id HAVING count(*) > 1
)
GROUP BY contact.user_account_id ,contact.customer_id, user_account.first_name, user_account.last_name, customer.customer_name
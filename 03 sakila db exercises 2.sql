-- 1. SELECT statements

-- 1a. Select all columns from the actor table.
SELECT * FROM actor;

-- 1b. Select only the last_name column from the actor table.
SELECT last_name FROM actor;

-- 1c. Select specific columns from the film table.
SELECT title, description, rental_duration, rental_rate, rental_duration * rental_rate AS total_rental_cost
FROM film;

-- ---------------------------------------------------------#

-- 2. DISTINCT operator

-- 2a. Select all distinct last names from the actor table.
SELECT DISTINCT last_name FROM actor;

-- 2b. Select all distinct postal codes from the address table.
SELECT DISTINCT postal_code FROM address;

-- 2c. Select all distinct ratings from the film table.
SELECT DISTINCT rating FROM film;

-- ---------------------------------------------------------#

-- 3. WHERE clause

-- 3a. Select specific columns from the films table that last 3 hours or longer.
SELECT title, description, rating, length
FROM film
WHERE length >= 180;

-- 3b. Select specific columns from the payments table for payments made on or after 05/27/2005.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date >= '2005-05-27';

-- 3c. Select specific columns from the payment table for payments made on 05/27/2005.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date = '2005-05-27';

-- 3d. Select all columns from the customer table for rows that have a last name beginning with "S" and a first name ending with "N".
SELECT *
FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

-- 3e. Select all columns from the customer table for rows where the customer is inactive or has a last name ending with "M".
SELECT *
FROM customer
WHERE active = 0 OR last_name LIKE '%M';

-- 3f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either "C", "S" or "T".
SELECT *
FROM category
WHERE category_id > 4 AND name LIKE 'C%' OR name LIKE 'S%' OR name LIKE 'T%';

-- 3g. Select all columns minus the password column from the staff table for rows that contain a password.
SELECT staff_id, first_name, last_name, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;

-- 3h. Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT staff_id, first_name, last_name, email, store_id, active, username, last_update, password
FROM staff
WHERE password IS NULL;

-- ---------------------------------------------------------#

-- 4. IN operator

-- 4a. Select specific columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT phone, district
FROM address
WHERE city_id IN (
    SELECT city_id
    FROM city
    WHERE country_id IN (
        SELECT country_id
        FROM country
        WHERE country IN ('California', 'England', 'Taipei', 'West Java')
    )
);

-- 4b. Select specific columns from the payment table for payments made on specific dates.
```sql

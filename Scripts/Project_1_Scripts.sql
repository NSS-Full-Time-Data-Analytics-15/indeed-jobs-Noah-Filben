SELECT * 
FROM public.data_analyst_jobs;


--Q1
SELECT
COUNT(title)
FROM public.data_analyst_jobs;

--Q2
SELECT company
FROM public.data_analyst_jobs
LIMIT 10;
--ExxonMobil

--Q3
SELECT
	COUNT(CASE WHEN location = 'TN' THEN 1 END) AS TN_Jobs,
	COUNT(CASE WHEN location = 'KY' THEN 1 END) AS KY_Jobs
FROM public.data_analyst_jobs;

--Q4
SELECT 
COUNT(star_rating)
FROM public.data_analyst_jobs
	WHERE star_rating >4 AND location = 'TN';

--Q5
SELECT 
COUNT(review_count)
FROM public.data_analyst_jobs
	WHERE review_count BETWEEN 500 AND 1000;

--Q6
SELECT 
	location AS state, 
	AVG(star_rating) AS avg_rating
FROM public.data_analyst_jobs
	WHERE location IS NOT NULL AND star_rating IS NOT NULL
	GROUP BY location
	ORDER BY avg_rating DESC;

--Q7
SELECT DISTINCT(title)
FROM public.data_analyst_jobs;

--Q8
SELECT DISTINCT(title)
FROM public.data_analyst_jobs
WHERE location = 'CA';
--Q9
SELECT 
	company, 
	review_count,
	AVG(star_rating)
FROM public.data_analyst_jobs
	WHERE review_count > 5000
	GROUP BY company, review_count;
----PT 2

SELECT 
	COUNT(DISTINCT company), 
	AVG(star_rating)
FROM public.data_analyst_jobs
	WHERE review_count > 5000;

--Q10
SELECT 
	company, 
	AVG(star_rating)
FROM public.data_analyst_jobs
	WHERE review_count > 5000
	GROUP BY company, star_rating
	ORDER BY star_rating DESC;
--American Express: 4.1999

--Q11
SELECT title
FROM public.data_analyst_jobs
WHERE title ILIKE '%analyst%';
--PT 2
SELECT COUNT(DISTINCT title)
FROM public.data_analyst_jobs
WHERE title ILIKE '%analyst%';
--Q12
SELECT COUNT(DISTINCT title)
FROM public.data_analyst_jobs
	WHERE title NOT ILIKE '%analyst%' 
	AND title NOT ILIKE '%analytics%';
--PT 2
SELECT title
FROM public.data_analyst_jobs
	WHERE title NOT ILIKE '%analyst%' 
	AND title NOT ILIKE '%analytics%';
--Tableau

--Bonus
SELECT domain, COUNT(domain)
FROM public.data_analyst_jobs
	WHERE skill ILIKE '%SQL%' 
	AND days_since_posting > 21
	AND domain IS NOT NULL
	GROUP BY domain
	ORDER BY COUNT(domain) DESC
LIMIT 4;




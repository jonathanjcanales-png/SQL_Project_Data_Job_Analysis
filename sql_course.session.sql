/*
SELECT
    job_id,
    job_title,
    'With Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL OR
    salary_hour_avg IS NOT NULL

UNION ALL

SELECT
    job_id,
    job_title,
    'Without Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NULL AND
    salary_hour_avg IS NULL

ORDER BY
    job_id,
    salary_info DESC;

    CREATE TABLE january_jobs AS


SELECT
    first_quarter_jobs.job_id,
    first_quarter_jobs.job_title_short,
    first_quarter_jobs.job_location,
    first_quarter_jobs.job_via,
    skills_dim.skills,
    skills_dim.type

FROM
    (
    SELECT
        *
    FROM
        january_jobs

    UNION ALL

    SELECT
       *
    FROM 
        february_jobs

    UNION ALL

    SELECT
       *
    FROM
        march_jobs
    ) AS first_quarter_jobs
LEFT JOIN skills_job_dim ON
    first_quarter_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    first_quarter_jobs.salary_year_avg > 70000
ORDER BY
    first_quarter_jobs.job_id;

*/


WITH first_quarter_jobs AS
(
    SELECT
        job_id,
        job_posted_date
    FROM january_jobs
    UNION ALL
    SELECT 
        job_id,
        job_posted_date
    FROM february_jobs
    UNION ALL
    SELECT 
        job_id,
        job_posted_date
    FROM march_jobs
),

skill_demand AS
(
    SELECT
        skills_dim.skills,
        EXTRACT (MONTH FROM first_quarter_jobs.job_posted_date) AS month_posted, 
        EXTRACT (YEAR FROM first_quarter_jobs.job_posted_date) AS year_posted,
        COUNT(first_quarter_jobs.job_id) AS quarter_count

    FROM first_quarter_jobs
    INNER JOIN skills_job_dim ON
        skills_job_dim.job_id = first_quarter_jobs.job_id
    INNER JOIN skills_dim ON 
        skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY
        skills_dim.skills,
        month_posted,
        year_posted
)

SELECT
   skills,
   month_posted,
   year_posted,
   quarter_count
FROM
    skill_demand

    


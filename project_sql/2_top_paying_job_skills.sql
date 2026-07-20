/*
Query to find skills required for top paying data analyst roles
    -Focuses on the top paying jobs from the first query
    -adds specific skills required for these roles
Why? Provides a detailed look at what skills a job seeker should develop
*/

WITH top_paying_jobs AS (
    SELECT
        job_postings_fact.job_id,
        company_dim.name AS company_name,
        job_postings_fact.job_title,   
        job_postings_fact.salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON
        job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
;

/*
The highest-paying Data Analyst jobs in 2023 share a consistent technical profile:

Core skills: SQL, Python, Tableau
Strong additions: R, Excel, Snowflake, Pandas
Growing demand: Cloud platforms (Azure, AWS, Snowflake, Databricks)
Professional advantage: Version control and collaboration tools (Git, Jira, Confluence)


[
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "r"
  }
]

*/
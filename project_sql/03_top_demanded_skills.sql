/*
Question : What are the most in-demand skills for a Data Analyst?
-- join job posting to inner join table similar to query 2
-- identify the top 5 in-demand skills for a Data Analyst.
-- focus on all job postings.
-- why? Retrieves the top  5 skills with the highest demand in the job market,
  providing insighs into the most valuable skills for job seekers.
  */
  SELECT 
  skills,
  count(skills_job_dim.job_id) AS demand_count
  FROM
  job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short ='Data Analyst' 
 GROUP BY
 skills
 ORDER BY demand_count DESC
  LIMIT 5;

  /*
  SQL is Non-Negotiable: With 92,628 job postings, SQL is the most in-demand skill by a significant margin.
   This underscores its foundational role in data extraction and manipulation across almost every business platform.

The Persistence of Excel: Excel (67,031 postings) is the second most demanded skill, 
demonstrating that fundamental business tools for quick data inspection, reporting, and presentation remain essential,
 even alongside advanced programming languages.

Programming and Visualization: Python (57,326 postings) is the primary programming language for analysis,
 while visualization tools like Tableau (46,554 postings) and Power BI (39,468 postings) round out the top five, 
 confirming the high demand for both analytical depth and communication skills.

Total Market Demand: The total demand across these five skills is 303,007 job postings, highlighting the massive and 
diverse job market for analysts who possess these core competencies.


[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
  */
/*
Question: What are the most optimal skills to learn(aka it's in high deamnd and a high paying skill)?
- identify skills in high deamand and associated with high average salaries for data analyst roles
-Concentrates on remote position with specified salaries 
- why? Tagret skills that offer job security(high demand ) and financial benefit(high salaries),
  offering strategic insights for career development in data analyst
*/
WITH skill_demand AS (
 SELECT 
 skills_dim.skill_id,
  skills_dim.skills,
  count(skills_job_dim.job_id) AS demand_count
  FROM
  job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short ='Data Analyst' AND
 salary_year_avg is NOT NULL
 GROUP BY
 skills_dim.skill_id
 
) , average_salary AS (
  SELECT 
 skills_job_dim.skill_id,
  round(AVG(salary_year_avg),0) AS Avg_Salary
  FROM
  job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short ='Data Analyst' AND
 salary_year_avg is NOT NULL
 GROUP BY
 skills_job_dim.skill_id
 
)

SELECT
skill_demand.skill_id,
skill_demand.skills,
demand_count,
Avg_Salary
FROM
skill_demand
INNER JOIN average_salary ON skill_demand.skill_id = average_salary.skill_id
WHERE
demand_count > 10 
ORDER BY
Avg_Salary DESC,
demand_count DESC
LIMIT 30;

/*

 -High-Reward/Low-Risk (The Optimal Zone): Skills like Databricks ($\$112,881$ avg, 102 demand), Spark ($\$113,002$ avg, 187 demand),
 and GCP ($\$113,065$ avg, 78 demand) offer both high salaries and strong job market presence.

 -High-Demand, Solid-Pay: Snowflake is the undisputed leader in demand, offering a reliable, high six-figure salary ($\$111,578$).
  It is a foundational requirement for many modern data roles.

 -Maximum Salary Premium: Skills like Kafka and PyTorch sit in the highest salary band on the chart, but with relatively lower demand.
  Mastering these indicates moving into specialized, highly paid Data Engineering or Machine Learning roles.

[
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "40",
    "avg_salary": "129999"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "20",
    "avg_salary": "125226"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "20",
    "avg_salary": "124686"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "24",
    "avg_salary": "120647"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "11",
    "avg_salary": "118407"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "15",
    "avg_salary": "117966"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "71",
    "avg_salary": "116387"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "59",
    "avg_salary": "115480"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "58",
    "avg_salary": "114883"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "62",
    "avg_salary": "114153"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "49",
    "avg_salary": "114058"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "78",
    "avg_salary": "113065"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "187",
    "avg_salary": "113002"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "demand_count": "15",
    "avg_salary": "112928"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "102",
    "avg_salary": "112881"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "74",
    "avg_salary": "112250"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "241",
    "avg_salary": "111578"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "44",
    "avg_salary": "111496"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demand_count": "37",
    "avg_salary": "111123"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "140",
    "avg_salary": "110888"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "90",
    "avg_salary": "110767"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demand_count": "23",
    "avg_salary": "109259"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "29",
    "avg_salary": "109052"
  },
  {
    "skill_id": 58,
    "skills": "neo4j",
    "demand_count": "12",
    "avg_salary": "108646"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "108",
    "avg_salary": "108331"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demand_count": "96",
    "avg_salary": "108221"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "90",
    "avg_salary": "107969"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "145",
    "avg_salary": "107931"
  }
]
*/

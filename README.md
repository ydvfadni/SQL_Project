
# ✨ Introduction
This project leverages real-world job data to highlight top-paying opportunities and hot skills for Data Analysts. The key aim: help you find remote jobs with great salaries and learn what skills to focus on for career growth.

 SQL queries Check them out here : [project_sql folder](/project_sql/)

# 📖 Background
Navigating the fast-moving data analytics space can be tough! This analysis answers:

💸 Which Data Analyst jobs pay the most?

🚀 What skills do they demand?

📈 How do skills impact what you earn?

This project is made for anyone seeking real career insights and a roadmap for skill-building.

Data hails for [My Project](https://lukebarousse.com). It is packed with insights on job_titles, salaries, locations, and essential skills.

# 🛠️ Tools I Used
- **SQL 📝 :** The foundation for querying and manipulating structured job market data. Empowered deep analysis of salary, skills, and openings.

- **PostgreSQL 🐘 :** A robust, open-source database system. Enabled advanced joins, aggregations, and complex queries for precise market insights.
- **VS Code 💻 :** My go-to for database management and executing SQL queries.
- **Git & GitHub 🔗 :** Essential for versions control and sharing my SQL scripts and analysis , ensuring collaboration and project tracking.

# 🧠 The Analysis

### 1.Top Paying Remote Data Analyst Jobs
  To identify the highest-paying roles, I filtered data analyst position by average yearly salary and location, focusing on remote jobs. This query highlight the high paying opportunity in the field.
```sql
  SELECT
   job_id,
   job_title,
   job_location,
   job_schedule_type,
   salary_year_avg,
   job_posted_date,
   NAME AS Company_Name
   FROM
   job_postings_fact
   LEFT JOIN 
   company_dim ON job_postings_fact.company_id = company_dim.company_id
   WHERE
   job_title_short= 'Data Analyst' AND
   job_location = 'Anywhere' AND
   salary_year_avg IS NOT NULL 
 ORDER BY
 salary_year_avg DESC
 LIMIT 10 ;
 ```
![Top paying Roles](Assests\01_top_paying_jobs.png)
 * Bar graph visualizing the result 

### 2. Top Paying Job-Skills
  To understand what skills are required for top-paying jobs, I joined the job posting with the skills data, providing insights into what employer value for high-compensation roles.
```sql
WITH top_paying_jobs AS (
SELECT
   job_id,
   job_title,
   salary_year_avg,
   NAME AS Company_Name
   FROM
   job_postings_fact
   LEFT JOIN 
   company_dim ON job_postings_fact.company_id = company_dim.company_id
   WHERE
   job_title_short= 'Data Analyst' AND
   job_location = 'Anywhere' AND
   salary_year_avg IS NOT NULL 
 ORDER BY
 salary_year_avg DESC
 LIMIT 10 
)
SELECT 
top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
salary_year_avg DESC;
```
![Top Paying Job-Skills](Assests\02_top_paying_data_analyst_skills.png)
* Bar graph visualizing the result 

### 3. Top Demanded Skills
This query helped identify  the skills most frequently requested in data analyst roles. 
``` sql
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
```
![Top Demanded Skills](Assests\03_top_demanded_skills.png)
* Bar graph visualizing result 

### 4. Top Paying Skills 
 Exploring the average salaries associated with different skills revealed which skills are the highest paying
```sql
 SELECT 
  skills,
  round(AVG(salary_year_avg),0) AS Avg_Salary
  FROM
  job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short ='Data Analyst' AND
 salary_year_avg is NOT NULL
 GROUP BY
 skills
 ORDER BY 
 Avg_Salary DESC
  LIMIT 20;
```
![Top Paying Skill](Assests\04_top_paying_skills.png)
* Bar graph showing result 


### 5. Optimal Skills
Combine insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and high salaries offering a strategic focus for skill development.

``` sql
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
```



# 🎓 What I Learned
- **Advanced SQL Querying 📝**
Developed expertise in writing complex queries, joins, aggregations, and filtering data to answer multifaceted business questions.

- **Database Design & Management 🗄️**
Improved my ability to structure and organize relational data using PostgreSQL, ensuring accurate relationships across tables.

- **Data Analysis for Career Insights 📊**
Learned how to connect raw job market data to actionable insights by examining salary trends and skill demand.

- **Version Control with Git & Collaboration on GitHub 🔗**
Gained confidence in tracking changes, collaborating, and publishing professional projects for peer review and sharing.

- **Effective Queries Workflows in VS Code 💻**
Mastered efficient queries editing, debugging, and project management using extensions and tools in VS Code for SQL development.

# 🏁 Conclusions
 ### Insights
 1. ***Top-Paying Data Analyst Jobs :***
Identified the top 10 highest-paying remote Data Analyst roles, providing a direct look at lucrative opportunities in the current market. This reveals which companies and positions offer the most competitive salaries for remote analysts.

2. ***Skills Required for Top-Paying Roles :***
Mapped the specific skill sets needed for the best-paid analyst jobs. Uncovered exactly which technical and analytical skills are valued most in these top-tier positions, guiding professional upskilling.

3. ***Most In-Demand Skills :***
Highlighted the top 5 most sought-after skills for Data Analysts. This helps job seekers understand what to focus on for maximum employability and relevance in the data analytics field.

4. ***Skills That Command Higher Salaries :***
Pinpointed which individual skills are consistently associated with higher average salaries. This provides data-driven advice on which skills to prioritize for financial advancement in analytics careers.

5. ***Optimal Skills Balancing Pay & Demand :***
Determined the “optimal” skills that are not only in high demand but also yield substantial salary benefits. These insights offer strategic guidance for career planning, targeting the best combination of job security and earning potential.

## Closing Thoughts 
 This project brings together advanced SQL, real-world job market data, and strategic data analysis to spotlight the skills and roles that truly matter for Data Analysts. Whether you’re aiming for high pay, job security, or in-demand expertise, these insights chart a clear roadmap for your next career move.
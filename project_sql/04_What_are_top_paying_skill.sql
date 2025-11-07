/* 
Question: What are the top skill based on salary?
- look at the average salary associated with each skill for data analyst position
- focuses on roles  with specified salaries, regardless of location
- Why? It reveals how different skills impact salary level for data analyst and
    help idenfity the most financially rewarding skills to acquire or improve 
*/


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

  /*
Extreme Outlier: The skill svn (Subversion) has an exceptionally high average salary of $400,000. 
This result is likely skewed by a few highly paid, specialized roles that list this legacy version control system in their requirements, 
potentially in niche fields like financial modeling or defense.

DevOps and Engineering Crossover: Many high-paying skills are traditionally associated with DevOps or Software Engineering,
 such as Golang ($155,000), VMware ($147,500), Terraform ($146,734), and Ansible ($124,370). This suggests that Data Analysts 
 who can build and manage their own pipelines and infrastructure are highly valued.

Advanced Data Science/AI: Skills related to machine learning and deep learning, including Keras ($127,013), PyTorch ($125,226), 
TensorFlow ($120,647), and Hugging Face ($123,950), command top salaries, indicating a strong financial reward for analysts performing advanced analytical work.

Niche Data Stores: Expertise in specialized database technologies like Couchbase ($160,515) and Cassandra ($118,407) is also highly rewarded.

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  }
]

  */
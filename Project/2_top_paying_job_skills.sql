/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        jpf.job_id,
        jpf.job_title,
        cd.name AS company_name,
        jpf.job_schedule_type,
        jpf.job_location,
        jpf.salary_year_avg AS avg_yearly_salary
    FROM
        job_postings_fact AS jpf
        LEFT JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND (job_work_from_home = TRUE OR job_location LIKE '%India%')
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 5
)

SELECT
    tpj.*,
    sd.skills
FROM
top_paying_jobs AS tpj
INNER JOIN skills_job_dim AS sjd
ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
ORDER BY
    tpj.avg_yearly_salary DESC

/*
Here's the result in JSON Format
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "skills": "flow"
  }
]
*/
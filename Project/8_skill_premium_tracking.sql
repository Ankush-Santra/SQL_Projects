/*
What is the salary premium for each skill compared to the running average of all data analyst positions?
- Shows understanding of window functions with PARTITION BY and moving averages
- Can use FIRST_VALUE/LAST_VALUE to compare against baseline salaries
*/

WITH company_stats AS (
    SELECT
        sd.skills AS skill_name,
        ROUND(AVG(salary_year_avg)) AS avg_skill_salary,
        ROUND(AVG(AVG(salary_year_avg)) OVER()) AS overall_avg_salary
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        sd.skills
    ORDER BY
        avg_skill_salary DESC
)

SELECT
    skill_name,
    avg_skill_salary,
    overall_avg_salary,
    -- CASE  -- Not needed, as the WHERE condition filters skills which pays above average market rate
    --     WHEN avg_skill_salary > overall_avg_salary THEN 'above market rate'
    --     WHEN avg_skill_salary < overall_avg_salary THEN 'below market rate'
    --     ELSE 'at_market_rate'
    -- END AS market_rate_comparison,
    ROUND(((avg_skill_salary - overall_avg_salary) / overall_avg_salary * 100), 2)||'%' as percentage_difference
FROM
    company_stats
WHERE  -- Feel free to comment WHERE statement to look for skills which pays same or below average market rate
    avg_skill_salary > overall_avg_salary
LIMIT 25  -- Feel free to comment the LIMIT to see the list of all the skills

/*
Here's the result in JSON format
[
  {
    "skill_name": "svn",
    "avg_skill_salary": "400000",
    "overall_avg_salary": "102020",
    "percentage_difference": "292.08%"
  },
  {
    "skill_name": "solidity",
    "avg_skill_salary": "179000",
    "overall_avg_salary": "102020",
    "percentage_difference": "75.46%"
  },
  {
    "skill_name": "couchbase",
    "avg_skill_salary": "160515",
    "overall_avg_salary": "102020",
    "percentage_difference": "57.34%"
  },
  {
    "skill_name": "datarobot",
    "avg_skill_salary": "155486",
    "overall_avg_salary": "102020",
    "percentage_difference": "52.41%"
  },
  {
    "skill_name": "golang",
    "avg_skill_salary": "155000",
    "overall_avg_salary": "102020",
    "percentage_difference": "51.93%"
  },
  {
    "skill_name": "mxnet",
    "avg_skill_salary": "149000",
    "overall_avg_salary": "102020",
    "percentage_difference": "46.05%"
  },
  {
    "skill_name": "dplyr",
    "avg_skill_salary": "147633",
    "overall_avg_salary": "102020",
    "percentage_difference": "44.71%"
  },
  {
    "skill_name": "vmware",
    "avg_skill_salary": "147500",
    "overall_avg_salary": "102020",
    "percentage_difference": "44.58%"
  },
  {
    "skill_name": "terraform",
    "avg_skill_salary": "146734",
    "overall_avg_salary": "102020",
    "percentage_difference": "43.83%"
  },
  {
    "skill_name": "twilio",
    "avg_skill_salary": "138500",
    "overall_avg_salary": "102020",
    "percentage_difference": "35.76%"
  },
  {
    "skill_name": "gitlab",
    "avg_skill_salary": "134126",
    "overall_avg_salary": "102020",
    "percentage_difference": "31.47%"
  },
  {
    "skill_name": "kafka",
    "avg_skill_salary": "129999",
    "overall_avg_salary": "102020",
    "percentage_difference": "27.43%"
  },
  {
    "skill_name": "puppet",
    "avg_skill_salary": "129820",
    "overall_avg_salary": "102020",
    "percentage_difference": "27.25%"
  },
  {
    "skill_name": "keras",
    "avg_skill_salary": "127013",
    "overall_avg_salary": "102020",
    "percentage_difference": "24.50%"
  },
  {
    "skill_name": "pytorch",
    "avg_skill_salary": "125226",
    "overall_avg_salary": "102020",
    "percentage_difference": "22.75%"
  },
  {
    "skill_name": "perl",
    "avg_skill_salary": "124686",
    "overall_avg_salary": "102020",
    "percentage_difference": "22.22%"
  },
  {
    "skill_name": "ansible",
    "avg_skill_salary": "124370",
    "overall_avg_salary": "102020",
    "percentage_difference": "21.91%"
  },
  {
    "skill_name": "hugging face",
    "avg_skill_salary": "123950",
    "overall_avg_salary": "102020",
    "percentage_difference": "21.50%"
  },
  {
    "skill_name": "tensorflow",
    "avg_skill_salary": "120647",
    "overall_avg_salary": "102020",
    "percentage_difference": "18.26%"
  },
  {
    "skill_name": "cassandra",
    "avg_skill_salary": "118407",
    "overall_avg_salary": "102020",
    "percentage_difference": "16.06%"
  },
  {
    "skill_name": "notion",
    "avg_skill_salary": "118092",
    "overall_avg_salary": "102020",
    "percentage_difference": "15.75%"
  },
  {
    "skill_name": "atlassian",
    "avg_skill_salary": "117966",
    "overall_avg_salary": "102020",
    "percentage_difference": "15.63%"
  },
  {
    "skill_name": "bitbucket",
    "avg_skill_salary": "116712",
    "overall_avg_salary": "102020",
    "percentage_difference": "14.40%"
  },
  {
    "skill_name": "airflow",
    "avg_skill_salary": "116387",
    "overall_avg_salary": "102020",
    "percentage_difference": "14.08%"
  },
  {
    "skill_name": "scala",
    "avg_skill_salary": "115480",
    "overall_avg_salary": "102020",
    "percentage_difference": "13.19%"
  }
]
*/
/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

-- Top-paying skills for Data Analysts
WITH skill_to_salary AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
    GROUP BY
        sjd.skill_id
)

SELECT
    sts.skill_id,
    sd.skills AS skill_name,
    sd.type AS skill_type,
    sts.avg_salary
FROM
    skill_to_salary AS sts
    INNER JOIN skills_dim AS sd
    ON sts.skill_id = sd.skill_id
ORDER BY
    sts.avg_salary DESC
LIMIT 10

/*
Here's the result in JSON format
[
  {
    "skill_id": 224,
    "skill_name": "svn",
    "skill_type": "other",
    "avg_salary": "400000"
  },
  {
    "skill_id": 38,
    "skill_name": "solidity",
    "skill_type": "programming",
    "avg_salary": "179000"
  },
  {
    "skill_id": 65,
    "skill_name": "couchbase",
    "skill_type": "databases",
    "avg_salary": "160515"
  },
  {
    "skill_id": 206,
    "skill_name": "datarobot",
    "skill_type": "analyst_tools",
    "avg_salary": "155486"
  },
  {
    "skill_id": 27,
    "skill_name": "golang",
    "skill_type": "programming",
    "avg_salary": "155000"
  }
]
*/

-- Top paying skills for Data Analysts (Remote)
WITH skill_to_salary AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
        AND jpf.job_work_from_home = TRUE
    GROUP BY
        sjd.skill_id
)

SELECT
    sts.skill_id,
    sd.skills AS skill_name,
    sd.type AS skill_type,
    sts.avg_salary
FROM
    skill_to_salary AS sts
    INNER JOIN skills_dim AS sd
    ON sts.skill_id = sd.skill_id
ORDER BY
    sts.avg_salary DESC
LIMIT 5

/*
Here's the result in JSON
[
  {
    "skill_id": 95,
    "skill_name": "pyspark",
    "skill_type": "libraries",
    "avg_salary": "208172"
  },
  {
    "skill_id": 218,
    "skill_name": "bitbucket",
    "skill_type": "other",
    "avg_salary": "189155"
  },
  {
    "skill_id": 65,
    "skill_name": "couchbase",
    "skill_type": "databases",
    "avg_salary": "160515"
  },
  {
    "skill_id": 85,
    "skill_name": "watson",
    "skill_type": "cloud",
    "avg_salary": "160515"
  },
  {
    "skill_id": 206,
    "skill_name": "datarobot",
    "skill_type": "analyst_tools",
    "avg_salary": "155486"
  }
]
*/

-- Top paying skills for Data Analysts (India)
WITH skill_to_salary AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
        AND jpf.job_location LIKE '%India%'
    GROUP BY
        sjd.skill_id
)

SELECT
    sts.skill_id,
    sd.skills AS skill_name,
    sd.type AS skill_type,
    sts.avg_salary
FROM
    skill_to_salary AS sts
    INNER JOIN skills_dim AS sd
    ON sts.skill_id = sd.skill_id
ORDER BY
    sts.avg_salary DESC
LIMIT 5

/*
Here's the result in JSON format
[
  {
    "skill_id": 169,
    "skill_name": "linux",
    "skill_type": "os",
    "avg_salary": "165000"
  },
  {
    "skill_id": 95,
    "skill_name": "pyspark",
    "skill_type": "libraries",
    "avg_salary": "165000"
  },
  {
    "skill_id": 57,
    "skill_name": "postgresql",
    "skill_type": "databases",
    "avg_salary": "165000"
  },
  {
    "skill_id": 56,
    "skill_name": "mysql",
    "skill_type": "databases",
    "avg_salary": "165000"
  },
  {
    "skill_id": 220,
    "skill_name": "gitlab",
    "skill_type": "other",
    "avg_salary": "165000"
  }
]
*/
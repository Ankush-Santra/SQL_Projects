/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

-- Top 5 in-demand skills for Data Analysts
WITH skill_count AS (
    SELECT
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
    GROUP BY
        sjd.skill_id
)

SELECT
    sc.*,
    sd.skills,
    sd.type
FROM
    skill_count AS sc
    INNER JOIN skills_dim AS sd
    ON sc.skill_id = sd.skill_id
ORDER BY
    sc.skill_count DESC
LIMIT 10

/*
Here's the result in JSON format
[
  {
    "skill_id": 0,
    "skill_count": "92628",
    "skills": "sql",
    "type": "programming"
  },
  {
    "skill_id": 181,
    "skill_count": "67031",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "skill_id": 1,
    "skill_count": "57326",
    "skills": "python",
    "type": "programming"
  },
  {
    "skill_id": 182,
    "skill_count": "46554",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "skill_id": 183,
    "skill_count": "39468",
    "skills": "power bi",
    "type": "analyst_tools"
  }
]
*/

-- Top 5 in-demand skills for Data Analysts (remote)
WITH skill_count AS (
    SELECT
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.job_work_from_home = TRUE
    GROUP BY
        sjd.skill_id
)

SELECT
    sc.*,
    sd.skills,
    sd.type
FROM
    skill_count AS sc
    INNER JOIN skills_dim AS sd
    ON sc.skill_id = sd.skill_id
ORDER BY
    sc.skill_count DESC
LIMIT 5

/*
Here's the result in JSON format
[
  {
    "skill_id": 0,
    "skill_count": "7291",
    "skills": "sql",
    "type": "programming"
  },
  {
    "skill_id": 181,
    "skill_count": "4611",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "skill_id": 1,
    "skill_count": "4330",
    "skills": "python",
    "type": "programming"
  },
  {
    "skill_id": 182,
    "skill_count": "3745",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "skill_id": 183,
    "skill_count": "2609",
    "skills": "power bi",
    "type": "analyst_tools"
  }
]
*/

-- Top 5 in-demand skills for Data Analysts (India)
WITH skill_count AS (
    SELECT
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.job_location LIKE '%India%'
    GROUP BY
        sjd.skill_id
)

SELECT
    sc.*,
    sd.skills,
    sd.type
FROM
    skill_count AS sc
    INNER JOIN skills_dim AS sd
    ON sc.skill_id = sd.skill_id
ORDER BY
    sc.skill_count DESC
LIMIT 5

/*
Here's the result in JSON
[
  {
    "skill_id": 0,
    "skill_count": "2867",
    "skills": "sql",
    "type": "programming"
  },
  {
    "skill_id": 181,
    "skill_count": "2072",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "skill_id": 1,
    "skill_count": "1937",
    "skills": "python",
    "type": "programming"
  },
  {
    "skill_id": 182,
    "skill_count": "1578",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "skill_id": 183,
    "skill_count": "1163",
    "skills": "power bi",
    "type": "analyst_tools"
  }
]
*/
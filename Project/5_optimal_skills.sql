/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- This code makes use of CTE for a clean, modular query.
-- In-demand skills prioritized over top-paying skills.
WITH in_demand_skills AS (
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
),

top_paying_skills AS (
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
)

SELECT
    ids.skill_id,
    ids.skills AS skill_name,
    ids.type AS skill_type,
    ids.skill_count,
    tps.avg_salary
FROM
    in_demand_skills AS ids
    INNER JOIN top_paying_skills AS tps
    ON ids.skill_id = tps.skill_id
WHERE
    ids.skill_count > 10
ORDER BY
    ids.skill_count DESC, tps.avg_salary DESC
LIMIT 25;

/*
Here's the result in JSON format.
[
  {
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming",
    "skill_count": "92628",
    "avg_salary": "96435"
  },
  {
    "skill_id": 181,
    "skill_name": "excel",
    "skill_type": "analyst_tools",
    "skill_count": "67031",
    "avg_salary": "86419"
  },
  {
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming",
    "skill_count": "57326",
    "avg_salary": "101512"
  },
  {
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools",
    "skill_count": "46554",
    "avg_salary": "97978"
  },
  {
    "skill_id": 183,
    "skill_name": "power bi",
    "skill_type": "analyst_tools",
    "skill_count": "39468",
    "avg_salary": "92324"
  },
  {
    "skill_id": 5,
    "skill_name": "r",
    "skill_type": "programming",
    "skill_count": "30075",
    "avg_salary": "98708"
  },
  {
    "skill_id": 186,
    "skill_name": "sas",
    "skill_type": "analyst_tools",
    "skill_count": "14034",
    "avg_salary": "93707"
  },
  {
    "skill_id": 7,
    "skill_name": "sas",
    "skill_type": "programming",
    "skill_count": "14034",
    "avg_salary": "93707"
  },
  {
    "skill_id": 196,
    "skill_name": "powerpoint",
    "skill_type": "analyst_tools",
    "skill_count": "13848",
    "avg_salary": "88316"
  },
  {
    "skill_id": 188,
    "skill_name": "word",
    "skill_type": "analyst_tools",
    "skill_count": "13591",
    "avg_salary": "82941"
  },
  {
    "skill_id": 189,
    "skill_name": "sap",
    "skill_type": "analyst_tools",
    "skill_count": "11297",
    "avg_salary": "92446"
  },
  {
    "skill_id": 74,
    "skill_name": "azure",
    "skill_type": "cloud",
    "skill_count": "10942",
    "avg_salary": "105400"
  },
  {
    "skill_id": 79,
    "skill_name": "oracle",
    "skill_type": "cloud",
    "skill_count": "10410",
    "avg_salary": "100964"
  },
  {
    "skill_id": 76,
    "skill_name": "aws",
    "skill_type": "cloud",
    "skill_count": "9063",
    "avg_salary": "106440"
  },
  {
    "skill_id": 61,
    "skill_name": "sql server",
    "skill_type": "databases",
    "skill_count": "8304",
    "avg_salary": "96191"
  },
  {
    "skill_id": 8,
    "skill_name": "go",
    "skill_type": "programming",
    "skill_count": "7928",
    "avg_salary": "97267"
  },
  {
    "skill_id": 215,
    "skill_name": "flow",
    "skill_type": "other",
    "skill_count": "7289",
    "avg_salary": "98020"
  },
  {
    "skill_id": 22,
    "skill_name": "vba",
    "skill_type": "programming",
    "skill_count": "6870",
    "avg_salary": "93845"
  },
  {
    "skill_id": 185,
    "skill_name": "looker",
    "skill_type": "analyst_tools",
    "skill_count": "6271",
    "avg_salary": "103855"
  },
  {
    "skill_id": 80,
    "skill_name": "snowflake",
    "skill_type": "cloud",
    "skill_count": "6194",
    "avg_salary": "111578"
  },
  {
    "skill_id": 187,
    "skill_name": "qlik",
    "skill_type": "analyst_tools",
    "skill_count": "5693",
    "avg_salary": "100933"
  },
  {
    "skill_id": 4,
    "skill_name": "java",
    "skill_type": "programming",
    "skill_count": "5251",
    "avg_salary": "100214"
  },
  {
    "skill_id": 92,
    "skill_name": "spark",
    "skill_type": "libraries",
    "skill_count": "5041",
    "avg_salary": "113002"
  },
  {
    "skill_id": 233,
    "skill_name": "jira",
    "skill_type": "async",
    "skill_count": "4753",
    "avg_salary": "107931"
  },
  {
    "skill_id": 199,
    "skill_name": "spss",
    "skill_type": "analyst_tools",
    "skill_count": "4711",
    "avg_salary": "85293"
  }
]
*/

-- An alternative, concise way to write the code without using CTEs
SELECT
    sd.skill_id,
    sd.skills AS skill_name,
    sd.type AS skill_type,
    COUNT(sjd.job_id) AS skill_count,
    AVG(jpf.salary_year_avg) AS avg_salary
FROM
    skills_dim AS sd
    INNER JOIN skills_job_dim AS sjd
    ON sd.skill_id = sjd.skill_id
    INNER JOIN job_postings_fact AS jpf
    ON sjd.job_id = jpf.job_id
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    skill_count DESC, avg_salary DESC

-- Top-paying skills prioritized over In-demand skills.
WITH in_demand_skills AS (
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
),

top_paying_skills AS (
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
)

SELECT
    ids.skill_id,
    ids.skills AS skill_name,
    ids.type AS skill_type,
    ids.skill_count,
    tps.avg_salary
FROM
    in_demand_skills AS ids
    INNER JOIN top_paying_skills AS tps
    ON ids.skill_id = tps.skill_id
WHERE
    ids.skill_count > 10
ORDER BY
    tps.avg_salary DESC, ids.skill_count DESC
LIMIT 25;

/*
Here's the result in JSON format
[
  {
    "skill_id": 224,
    "skill_name": "svn",
    "skill_type": "other",
    "skill_count": "58",
    "avg_salary": "400000"
  },
  {
    "skill_id": 38,
    "skill_name": "solidity",
    "skill_type": "programming",
    "skill_count": "50",
    "avg_salary": "179000"
  },
  {
    "skill_id": 65,
    "skill_name": "couchbase",
    "skill_type": "databases",
    "skill_count": "22",
    "avg_salary": "160515"
  },
  {
    "skill_id": 206,
    "skill_name": "datarobot",
    "skill_type": "analyst_tools",
    "skill_count": "41",
    "avg_salary": "155486"
  },
  {
    "skill_id": 27,
    "skill_name": "golang",
    "skill_type": "programming",
    "skill_count": "79",
    "avg_salary": "155000"
  },
  {
    "skill_id": 109,
    "skill_name": "mxnet",
    "skill_type": "libraries",
    "skill_count": "20",
    "avg_salary": "149000"
  },
  {
    "skill_id": 119,
    "skill_name": "dplyr",
    "skill_type": "libraries",
    "skill_count": "94",
    "avg_salary": "147633"
  },
  {
    "skill_id": 73,
    "skill_name": "vmware",
    "skill_type": "cloud",
    "skill_count": "184",
    "avg_salary": "147500"
  },
  {
    "skill_id": 212,
    "skill_name": "terraform",
    "skill_type": "other",
    "skill_count": "270",
    "avg_salary": "146734"
  },
  {
    "skill_id": 250,
    "skill_name": "twilio",
    "skill_type": "sync",
    "skill_count": "30",
    "avg_salary": "138500"
  },
  {
    "skill_id": 220,
    "skill_name": "gitlab",
    "skill_type": "other",
    "skill_count": "514",
    "avg_salary": "134126"
  },
  {
    "skill_id": 98,
    "skill_name": "kafka",
    "skill_type": "libraries",
    "skill_count": "1205",
    "avg_salary": "129999"
  },
  {
    "skill_id": 222,
    "skill_name": "puppet",
    "skill_type": "other",
    "skill_count": "40",
    "avg_salary": "129820"
  },
  {
    "skill_id": 100,
    "skill_name": "keras",
    "skill_type": "libraries",
    "skill_count": "210",
    "avg_salary": "127013"
  },
  {
    "skill_id": 101,
    "skill_name": "pytorch",
    "skill_type": "libraries",
    "skill_count": "486",
    "avg_salary": "125226"
  },
  {
    "skill_id": 31,
    "skill_name": "perl",
    "skill_type": "programming",
    "skill_count": "578",
    "avg_salary": "124686"
  },
  {
    "skill_id": 223,
    "skill_name": "ansible",
    "skill_type": "other",
    "skill_count": "186",
    "avg_salary": "124370"
  },
  {
    "skill_id": 121,
    "skill_name": "hugging face",
    "skill_type": "libraries",
    "skill_count": "11",
    "avg_salary": "123950"
  },
  {
    "skill_id": 99,
    "skill_name": "tensorflow",
    "skill_type": "libraries",
    "skill_count": "772",
    "avg_salary": "120647"
  },
  {
    "skill_id": 63,
    "skill_name": "cassandra",
    "skill_type": "databases",
    "skill_count": "321",
    "avg_salary": "118407"
  },
  {
    "skill_id": 238,
    "skill_name": "notion",
    "skill_type": "async",
    "skill_count": "382",
    "avg_salary": "118092"
  },
  {
    "skill_id": 219,
    "skill_name": "atlassian",
    "skill_type": "other",
    "skill_count": "337",
    "avg_salary": "117966"
  },
  {
    "skill_id": 218,
    "skill_name": "bitbucket",
    "skill_type": "other",
    "skill_count": "338",
    "avg_salary": "116712"
  },
  {
    "skill_id": 96,
    "skill_name": "airflow",
    "skill_type": "libraries",
    "skill_count": "2012",
    "avg_salary": "116387"
  },
  {
    "skill_id": 3,
    "skill_name": "scala",
    "skill_type": "programming",
    "skill_count": "1864",
    "avg_salary": "115480"
  }
]
*/
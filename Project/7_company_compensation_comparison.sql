/*
How does each company's data analyst salary compare to the industry average, and which companies consistently pay above the market rate?
- Uses window functions to calculate running averages and company-specific rankings
- Demonstrates PARTITION BY with aggregates
*/

WITH company_stats AS (
    SELECT
        cd.name,
        ROUND(AVG(salary_year_avg)) AS avg_company_salary,
        ROUND(AVG(AVG(salary_year_avg)) OVER()) AS overall_avg_salary
    FROM
        job_postings_fact AS jpf
        INNER JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        cd.name
    ORDER BY
        avg_company_salary DESC
)

SELECT
    name,
    avg_company_salary,
    overall_avg_salary,
    -- CASE -- Not needed, as the WHERE condition will filter those companies which pay above the average market rate
    --     WHEN avg_company_salary > overall_avg_salary THEN 'above market rate'
    --     WHEN avg_company_salary < overall_avg_salary THEN 'below market rate'
    --     ELSE 'at_market_rate'
    -- END AS market_rate_comparison,
    ROUND(((avg_company_salary - overall_avg_salary) / overall_avg_salary * 100), 2)||'%' as percentage_difference
FROM
    company_stats
WHERE -- You might want to see companies below market rate, feel free to comment the WHERE condition
    avg_company_salary > overall_avg_salary
LIMIT 25  -- Feel free to comment LIMIT to see the list of all companies

/*
Here's the result in JSON format
[
  {
    "name": "Mantys",
    "avg_company_salary": "650000",
    "overall_avg_salary": "91931",
    "percentage_difference": "607.05%"
  },
  {
    "name": "ЛАНИТ",
    "avg_company_salary": "400000",
    "overall_avg_salary": "91931",
    "percentage_difference": "335.11%"
  },
  {
    "name": "Torc Robotics",
    "avg_company_salary": "375000",
    "overall_avg_salary": "91931",
    "percentage_difference": "307.91%"
  },
  {
    "name": "Illuminate Mission Solutions",
    "avg_company_salary": "375000",
    "overall_avg_salary": "91931",
    "percentage_difference": "307.91%"
  },
  {
    "name": "Care.com",
    "avg_company_salary": "350000",
    "overall_avg_salary": "91931",
    "percentage_difference": "280.72%"
  },
  {
    "name": "Anthropic",
    "avg_company_salary": "295000",
    "overall_avg_salary": "91931",
    "percentage_difference": "220.89%"
  },
  {
    "name": "OpenAI",
    "avg_company_salary": "285000",
    "overall_avg_salary": "91931",
    "percentage_difference": "210.02%"
  },
  {
    "name": "Google",
    "avg_company_salary": "254000",
    "overall_avg_salary": "91931",
    "percentage_difference": "176.29%"
  },
  {
    "name": "Asana",
    "avg_company_salary": "235000",
    "overall_avg_salary": "91931",
    "percentage_difference": "155.63%"
  },
  {
    "name": "Pinterest Job Advertisements",
    "avg_company_salary": "232423",
    "overall_avg_salary": "91931",
    "percentage_difference": "152.82%"
  },
  {
    "name": "Genentech",
    "avg_company_salary": "230000",
    "overall_avg_salary": "91931",
    "percentage_difference": "150.19%"
  },
  {
    "name": "CliftonLarsonAllen",
    "avg_company_salary": "225000",
    "overall_avg_salary": "91931",
    "percentage_difference": "144.75%"
  },
  {
    "name": "GovCIO",
    "avg_company_salary": "225000",
    "overall_avg_salary": "91931",
    "percentage_difference": "144.75%"
  },
  {
    "name": "MosaicML",
    "avg_company_salary": "220000",
    "overall_avg_salary": "91931",
    "percentage_difference": "139.31%"
  },
  {
    "name": "Ball",
    "avg_company_salary": "218500",
    "overall_avg_salary": "91931",
    "percentage_difference": "137.68%"
  },
  {
    "name": "Uclahealthcareers",
    "avg_company_salary": "217000",
    "overall_avg_salary": "91931",
    "percentage_difference": "136.05%"
  },
  {
    "name": "F. Hoffmann-La Roche AG",
    "avg_company_salary": "215643",
    "overall_avg_salary": "91931",
    "percentage_difference": "134.57%"
  },
  {
    "name": "Channel Personnel Services",
    "avg_company_salary": "210000",
    "overall_avg_salary": "91931",
    "percentage_difference": "128.43%"
  },
  {
    "name": "Walmart Global Tech",
    "avg_company_salary": "203833",
    "overall_avg_salary": "91931",
    "percentage_difference": "121.72%"
  },
  {
    "name": "ThinkingData",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  },
  {
    "name": "Airbnb",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  },
  {
    "name": "Snakorpio Group Inc.",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  },
  {
    "name": "Upstart",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  },
  {
    "name": "Withings",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  },
  {
    "name": "WINGS-ICT-SOLUTIONS",
    "avg_company_salary": "200000",
    "overall_avg_salary": "91931",
    "percentage_difference": "117.55%"
  }
]
*/
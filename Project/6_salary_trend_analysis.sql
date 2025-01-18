/*
What is the month-over-month growth rate of average salaries for data analyst positions?
- This uses window functions to calculate the percentage change in salaries over consecutive months
- Demonstrates knowledge of LAG/LEAD functions combined with date calculations
*/

SELECT
    job_posted_month,
    avg_monthly_salary,
    prev_month_avg_salary,
    (avg_monthly_salary - prev_month_avg_salary) AS monthly_diff,
    ROUND(((avg_monthly_salary - prev_month_avg_salary) / prev_month_avg_salary) * 100, 2)||'%' AS monthly_diff_percentage
FROM (
    SELECT 
        EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
        ROUND(AVG(salary_year_avg)) AS avg_monthly_salary,
        LAG(ROUND(AVG(salary_year_avg))) OVER(ORDER BY EXTRACT(MONTH FROM job_posted_date)) AS prev_month_avg_salary
    FROM 
        job_postings_fact
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        EXTRACT(MONTH FROM job_posted_date)
    ORDER BY
        job_posted_month
)

/*
Here's the result in JSON format
[
  {
    "job_posted_month": "1",
    "avg_monthly_salary": "92966",
    "prev_month_avg_salary": null,
    "monthly_diff": null,
    "monthly_diff_percentage": null
  },
  {
    "job_posted_month": "2",
    "avg_monthly_salary": "94979",
    "prev_month_avg_salary": "92966",
    "monthly_diff": "2013",
    "monthly_diff_percentage": "2.17%"
  },
  {
    "job_posted_month": "3",
    "avg_monthly_salary": "93524",
    "prev_month_avg_salary": "94979",
    "monthly_diff": "-1455",
    "monthly_diff_percentage": "-1.53%"
  },
  {
    "job_posted_month": "4",
    "avg_monthly_salary": "94807",
    "prev_month_avg_salary": "93524",
    "monthly_diff": "1283",
    "monthly_diff_percentage": "1.37%"
  },
  {
    "job_posted_month": "5",
    "avg_monthly_salary": "94298",
    "prev_month_avg_salary": "94807",
    "monthly_diff": "-509",
    "monthly_diff_percentage": "-0.54%"
  },
  {
    "job_posted_month": "6",
    "avg_monthly_salary": "97636",
    "prev_month_avg_salary": "94298",
    "monthly_diff": "3338",
    "monthly_diff_percentage": "3.54%"
  },
  {
    "job_posted_month": "7",
    "avg_monthly_salary": "98138",
    "prev_month_avg_salary": "97636",
    "monthly_diff": "502",
    "monthly_diff_percentage": "0.51%"
  },
  {
    "job_posted_month": "8",
    "avg_monthly_salary": "98105",
    "prev_month_avg_salary": "98138",
    "monthly_diff": "-33",
    "monthly_diff_percentage": "-0.03%"
  },
  {
    "job_posted_month": "9",
    "avg_monthly_salary": "92074",
    "prev_month_avg_salary": "98105",
    "monthly_diff": "-6031",
    "monthly_diff_percentage": "-6.15%"
  },
  {
    "job_posted_month": "10",
    "avg_monthly_salary": "90216",
    "prev_month_avg_salary": "92074",
    "monthly_diff": "-1858",
    "monthly_diff_percentage": "-2.02%"
  },
  {
    "job_posted_month": "11",
    "avg_monthly_salary": "86854",
    "prev_month_avg_salary": "90216",
    "monthly_diff": "-3362",
    "monthly_diff_percentage": "-3.73%"
  },
  {
    "job_posted_month": "12",
    "avg_monthly_salary": "86639",
    "prev_month_avg_salary": "86854",
    "monthly_diff": "-215",
    "monthly_diff_percentage": "-0.25%"
  }
]
*/
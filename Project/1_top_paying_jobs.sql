/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

-- Top 10 highest paying Data Analyst roles (Remote & India)
SELECT
    jpf.job_id,
    jpf.job_title,
    cd.name AS company_name,
    jpf.job_schedule_type,
    -- jpf.job_location,
    jpf.salary_year_avg AS avg_yearly_salary,
    jpf.job_posted_date
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
LIMIT 10

/*
Here's the result in JSON
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "avg_yearly_salary": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04"
  }
]
*/

-- Top 10 highest paying Data Analyst roles (India)
SELECT
    jpf.job_id,
    jpf.job_title,
    cd.name AS company_name,
    jpf.job_schedule_type,
    jpf.job_location,
    jpf.salary_year_avg AS avg_yearly_salary,
    jpf.job_posted_date
FROM
    job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location LIKE '%India%'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
Here's the result in JSON
[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "company_name": "ServiceNow",
    "job_schedule_type": "Full-time",
    "job_location": "Hyderabad, Telangana, India",
    "avg_yearly_salary": "177283.0",
    "job_posted_date": "2023-06-28 18:35:45"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "job_schedule_type": "Full-time",
    "job_location": "Bengaluru, Karnataka, India",
    "avg_yearly_salary": "165000.0",
    "job_posted_date": "2023-05-06 20:30:35"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "job_schedule_type": "Full-time",
    "job_location": "Bengaluru, Karnataka, India",
    "avg_yearly_salary": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "job_schedule_type": "Full-time",
    "job_location": "Gurugram, Haryana, India",
    "avg_yearly_salary": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_schedule_type": "Full-time",
    "job_location": "Hyderabad, Telangana, India",
    "avg_yearly_salary": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "job_schedule_type": "Full-time",
    "job_location": "Hyderabad, Telangana, India",
    "avg_yearly_salary": "163782.0",
    "job_posted_date": "2023-07-06 21:12:14"
  },
  {
    "job_id": 456405,
    "job_title": "Master Data Analyst",
    "company_name": "Vertellus Specialities Inc",
    "job_schedule_type": "Full-time",
    "job_location": "Indianapolis, IN",
    "avg_yearly_salary": "125000.0",
    "job_posted_date": "2023-02-20 10:01:56"
  },
  {
    "job_id": 1122921,
    "job_title": "Data Analyst",
    "company_name": "Elevance Health",
    "job_schedule_type": "Full-time",
    "job_location": "Indianapolis, IN",
    "avg_yearly_salary": "120624.0",
    "job_posted_date": "2023-06-30 09:02:31"
  },
  {
    "job_id": 635922,
    "job_title": "Business Information Consultant- Provider Data Analytics",
    "company_name": "Elevance Health",
    "job_schedule_type": "Full-time",
    "job_location": "Indianapolis, IN",
    "avg_yearly_salary": "120624.0",
    "job_posted_date": "2023-07-24 08:02:21"
  },
  {
    "job_id": 1127267,
    "job_title": "Data Analyst",
    "company_name": "Deloitte",
    "job_schedule_type": "Full-time",
    "job_location": "Indianapolis, IN",
    "avg_yearly_salary": "119328.5",
    "job_posted_date": "2023-06-22 08:02:07"
  }
]
*/
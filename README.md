# SQL Projects

# Table of Contents
- [Dataset Overview](#dataset-overview)

    - [Repository Structure](#repository-structure)
    - [Setup Instructions](#setup-instructions)

        - [Prerequisites](#prerequisites)
        - [Installation Steps](#installation-steps)
    - [Troubleshooting](#troubleshooting)

- [Skills Required](#skills-required)
- [Purpose](#purpose)
- [Insights](#insights)


# Dataset Overview
This project utilizes a comprehensive dataset of global data job postings. To ensure complete reproducibility, all necessary files have been included in the repository.
## Repository Structure
The repository contains two main folders:
- **csv_files**: Contains the raw dataset files
- **sql_load**: Contains SQL scripts for table creation and data loading
## Setup Instructions
### Prerequisites
- **PostgreSQL** (recommended for full compatibility)
- **Excel** (For visualizations)
- **Note**: While other RDBMS might work due to similar SQL syntax, PostgreSQL is preferred for guaranteed functionality
## Installation Steps
- Download the ZIP file from GitHub
- Extract the contents to your desired location
- Execute the SQL scripts located in the sql_load folder
## Troubleshooting
If you encounter permission-related issues during execution, refer to the detailed troubleshooting steps provided as comments within the SQL files.

</br>

# Skills Required
To effectively understand and work with the queries in this project, you should be familiar with the following SQL concepts:
- Basic SQL Statements
- SQL Joins
- Unions
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- And more

</br>

# Purpose
This project provides a collection of SQL queries designed to offer unique insights for **job seekers in the field of data analytics**. The queries enable users to explore the job market by analyzing key aspects such as top-paying jobs, high-demand skills, top-paying technical skills, salary trends, and more. Additionally, visualizations have been included to enhance understanding and make the data more accessible.

</br>

# Insights
This section highlights key insights derived from the SQL queries, each supported by a visualization for better understanding. While not every possible permutation and combination is covered here, I highly encourage exploring the [SQL files](/Project/) directly for a more comprehensive view.
[The Excel worksheet used for visualizations has been included for your reference.]

</br>

#### What are the top-paying data analyst jobs?
<div align="center">
  <img src="/Images/top_paying_jobs.png" width="70%">
  <p>The role of a Data Analyst not only offers competitive compensation but also remains consistently in demand.</p>
</div>

</br>

#### What skills are required for the top-paying data analyst jobs?
<div align="center">
  <img src="/Images/top_paying_job_skills.png" width="70%">
  <p>While specialized skills often attract higher salaries, they come with trade-offs, such as limited job availability.</p>
</div>

</br>

#### What are the most in-demand skills for data analysts?
<div align="center">
  <img src="/Images/top_demanded_skills.png" width="70%">
  <p>Tools and languages like SQL, Excel, Python, Tableau, and Power BI continue to lead as the most in-demand skills in the industry.</p>
</div>

</br>

#### What are the top skills based on salary?
<div align="center">
  <img src="/Images/top_paying_skills.png" width="70%">
  <p>Similar to previous observations, niche technical skills consistently result in higher pay scales for professionals.</p>
</div>

</br>

#### What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
<div align="center">
  <img src="/Images/optimal_skills.png" width="70%">
  <p>Despite the complexity of the data, the conclusion remains steady: niche skills command a premium, while universally required skills like SQL and Excel offer solid but comparatively lower pay.</p>
</div>

</br>

#### What is the month-over-month growth rate of average salaries for data analyst positions?
<div align="center">
  <img src="/Images/salary_trend_analysis.png" width="70%">
  <p>Job listings see a noticeable spike mid-year before tapering off toward the end of the year.</p>
</div>

</br>

#### How does each company's data analyst salary compare to the industry average, and which companies consistently pay above the market rate?
<div align="center">
  <img src="/Images/company_compensation_comparison.png" width="70%">
  <p>Leading tech companies like Mantys, OpenAI, and Anthropic consistently offer salaries well above market standards, making them stand out as top-paying employers.</p>
</div>

</br>

#### What is the salary premium for each skill compared to the running average of all data analyst positions?
<div align="center">
  <img src="/Images/skill_tracking_premium.png" width="70%">
  <p>Across all visualizations, the trend is clear—niche skills lead to significantly higher salaries when compared to broader, in-demand technical skills.</p>
</div>
/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Insights - Query 4: Top 25 Highest-Paying Skills for Data Analysts

1. AI & Machine Learning Command a Premium
   - Frameworks like PyTorch ($125k), Keras ($127k), TensorFlow ($120k), 
     Hugging Face ($124k), and DataRobot ($155k) top the list.
   - Bridging standard data analysis with Machine Learning yields the highest pay.

2. DevOps & Infrastructure Skills Boost Compensation
   - Tools like Terraform ($147k), VMware ($148k), Puppet ($130k), and Ansible ($124k) 
     appear frequently.
   - Analysts who can manage their own pipelines and cloud environments get paid significantly more.

3. Big Data & Streaming Technologies Outpace Traditional Tools
   - High-throughput platforms like Kafka ($130k), Cassandra ($118k), Airflow ($116k), 
     and Scala ($115k) command top-tier salaries compared to standard SQL/Excel.

4. Niche & Specialized Languages
   - Languages like Golang ($155k) and Solidity ($179k) reflect specialized blockchain 
     or backend systems engineering roles categorized under analyst titles.

5. Watch Out for Outliers
   - SVN ($400k) ranks #1 due to low sample size (single job postings with extreme salaries). 
   - Always analyze posting volume alongside average salary before drawing conclusions.
*/
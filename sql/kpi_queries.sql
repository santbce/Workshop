-- KPI 1: contrataciones por tecnología
SELECT
    jp.technology,
    COUNT(*) AS hires
FROM fact_applications f
JOIN dim_job_profiles jp
    ON f.job_profile_id = jp.job_profile_id
WHERE f.is_hired = 1
GROUP BY jp.technology
ORDER BY hires DESC;


-- KPI 2: contrataciones por año
SELECT
    d.year,
    COUNT(*) AS hires
FROM fact_applications f
JOIN dim_date d
    ON f.date_id = d.date_id
WHERE f.is_hired = 1
GROUP BY d.year
ORDER BY d.year;


-- KPI 3: contrataciones por seniority
SELECT
    jp.seniority,
    COUNT(*) AS hires
FROM fact_applications f
JOIN dim_job_profiles jp
    ON f.job_profile_id = jp.job_profile_id
WHERE f.is_hired = 1
GROUP BY jp.seniority
ORDER BY hires DESC;


-- KPI 4: contrataciones por país y año
SELECT
    d.year,
    l.country_name,
    COUNT(*) AS hires
FROM fact_applications f
JOIN dim_date d
    ON f.date_id = d.date_id
JOIN dim_location l
    ON f.country_id = l.country_id
WHERE f.is_hired = 1
  AND l.country_name IN ('USA', 'Brazil', 'Colombia', 'Ecuador')
GROUP BY d.year, l.country_name
ORDER BY d.year, l.country_name;
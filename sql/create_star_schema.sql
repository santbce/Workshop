PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS dim_candidates (
    candidate_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date TEXT NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_location (
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS dim_job_profiles (
    job_profile_id INTEGER PRIMARY KEY AUTOINCREMENT,
    technology TEXT NOT NULL,
    seniority TEXT NOT NULL,
    UNIQUE (technology, seniority)
);

CREATE TABLE IF NOT EXISTS fact_applications (
    application_id INTEGER PRIMARY KEY AUTOINCREMENT,
    job_profile_id INTEGER NOT NULL,
    candidate_id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    date_id INTEGER NOT NULL,
    yoe REAL NOT NULL,
    code_challenge_score REAL NOT NULL,
    technical_interview_score REAL NOT NULL,
    is_hired INTEGER NOT NULL CHECK (is_hired IN (0, 1)),

    FOREIGN KEY (job_profile_id) REFERENCES dim_job_profiles(job_profile_id),
    FOREIGN KEY (candidate_id) REFERENCES dim_candidates(candidate_id),
    FOREIGN KEY (country_id) REFERENCES dim_location(country_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
# Workshop 001
 ETL Project


## Project Description

This project is an ETL process for candidate data.

The project reads a CSV file, cleans the data, saves it in a SQLite Data Warehouse, and creates charts from the database.

## Tools Used

- Python
- Pandas
- SQLite
- Jupyter Notebook
- Matplotlib
- Seaborn

## Project Structure

desarrollo_workshop/
├── data/
│   └── candidates.csv
├── docs/
│   ├── modelo_dimensional.png
│   └── Justificación del modelo dimensional.txt
├── notebooks/
│   └── etl_and_analysis.ipynb
├── sql/
│   ├── create_star_schema.sql
│   └── kpi_queries.sql
├── warehouse/
│   └── candidates_dw.db
├── requirements.txt
├── .gitignore
└── README.md
```

## Data Model

The project uses a star schema.

The main table is `fact_applications`. One row represents one candidate application.

This table saves:

- Years of experience.
- Code challenge score.
- Technical interview score.
- Hiring result.

The dimension tables are:

- `dim_candidates`: candidate name and email.
- `dim_date`: application date, year, month, and day.
- `dim_location`: candidate country.
- `dim_job_profiles`: technology and seniority.

The data model image is in:
docs/modelo_dimensional.png

## ETL Process

### Extract

The project reads the original CSV file:

```text
data/candidates.csv
```

### Transform

The project cleans the data by:

- Standardizing column names.
- Converting dates and numbers.
- Removing duplicate records.
- Removing incomplete records.
- Checking score and experience values.
- Creating the `is_hired` column.

A candidate is hired when both scores are 7 or more:

```python
is_hired = (
    (code_challenge_score >= 7)
    & (technical_interview_score >= 7)
)
```

### Load

The cleaned data is saved in a SQLite Data Warehouse:
warehouse/candidates_dw.db


The project loaded 39,048 valid applications and found 5,285 hired candidates.

## KPIs and Charts

All reports come from the Data Warehouse, not from the CSV file.

The project includes:

1. Hires by technology.
2. Hires by year.
3. Hires by seniority.
4. Hires by country over years for USA, Brazil, Colombia, and Ecuador.

The SQL queries are in:
sql/kpi_queries.sql


# Workshop

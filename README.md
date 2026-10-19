# AI Quality Analytics

AI Quality Analytics is a portfolio project for exploring how structured evaluation data can support quality monitoring for AI-generated responses. It uses a fictional dataset and demonstrates relational data modeling, MySQL, analytical SQL, and a planned Power BI reporting layer.

This project is a learning and demonstration artifact. Its sample records do not represent real company performance, customer data, or the author's employment or work experience.

## Goals

- Model evaluations, reviewers, and evaluation categories in a relational database.
- Use MySQL 8.4-compatible DDL, constraints, and analytical queries.
- Define transparent metrics for approval, detected errors, category performance, reviewer activity, and quality trends.
- Prepare a clean foundation for a future Power BI dashboard.

## Tools

- MySQL 8.4 and MySQL Workbench
- SQL for schema creation, sample data, and analysis
- Power BI (planned; no report is included yet)

No application code or extra software dependencies are required for the initial database work.

## Planned metrics

- **Total evaluations:** count of evaluation records.
- **Approval rate:** approved evaluations divided by all evaluations, expressed as a percentage.
- **Error rate:** evaluations flagged with at least one error divided by all evaluations, expressed as a percentage. This is a record-level flag, not a count of individual errors.
- **Results by category:** evaluation volume, approval rate, error rate, and average quality score for each category.
- **Reviewer productivity:** evaluations completed and average review time by reviewer. This measures volume, not reviewer quality or speed ranking.
- **Quality trends:** monthly evaluation volume, approval rate, error rate, and average quality score.

All rates use the applicable evaluation records as their denominator; empty groups are protected against division by zero in the queries. The sample data includes several months, categories, reviewers, outcomes, and error flags so each query returns useful results.

## Repository structure

```text
data/       Reserved for future source or exported data; no files are included yet.
docs/       Data dictionary and project documentation.
powerbi/    Reserved for a future Power BI report; no report is included yet.
sql/        Database, schema, sample data, and analysis scripts.
README.md   Project overview and setup instructions.
```

## Set up in MySQL Workbench

1. Install and start a MySQL 8.4 server, then connect to it from MySQL Workbench.
2. Open each SQL file in the order below and execute it against the connected server:
   1. `sql/01_create_database.sql`
   2. `sql/02_create_tables.sql`
   3. `sql/03_insert_sample_data.sql`
   4. `sql/04_quality_analysis.sql`
3. The first script creates and selects `ai_quality_analytics`; the next scripts create tables, load fictional records, and run read-only example analyses.

The scripts assume the connected MySQL account can create databases and tables and insert rows. The sample insert script is intended for a fresh schema and uses fixed primary keys; recreate the schema before loading it a second time to avoid duplicate-key errors. The analysis file contains separate `SELECT` statements; execute the whole file or run individual statements to inspect specific metrics.

See [the data dictionary](docs/data-dictionary.md) for column definitions and modeling assumptions.

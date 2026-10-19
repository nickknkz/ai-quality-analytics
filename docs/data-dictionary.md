# Data Dictionary

## Scope and assumptions

The schema stores one row per reviewed AI response. The records and reviewer names are fictional and exist only to demonstrate analysis. An evaluation has exactly one reviewer and one category. `error_detected` indicates whether one or more issues were found; the schema does not attempt to count individual error types. `quality_score` is a reviewer-assigned score from 1.00 (lowest) to 5.00 (highest). `review_minutes` is a non-negative duration for the review.

The database uses `utf8mb4` with `utf8mb4_0900_ai_ci`. Timestamps are stored as `DATETIME` without a time zone; the sample timestamps are illustrative. Outcomes distinguish approvals, revision requests, and rejections. An approval rate counts only `APPROVED`; error rate counts records with `error_detected = TRUE`.

## Tables

### `reviewers`

| Column | MySQL type | Meaning / constraints |
|---|---|---|
| `reviewer_id` | `INT UNSIGNED` | Primary key; fictional reviewer identifier. |
| `reviewer_name` | `VARCHAR(100)` | Fictional display name; required. |
| `team_name` | `VARCHAR(80)` | Fictional team label; required. |
| `is_active` | `BOOLEAN` | Whether the reviewer is currently active; required, defaults to `TRUE`. Historical evaluations remain associated with inactive reviewers. |
| `created_at` | `DATETIME` | Row creation time; required, defaults to the current timestamp. |

### `evaluation_categories`

| Column | MySQL type | Meaning / constraints |
|---|---|---|
| `category_id` | `SMALLINT UNSIGNED` | Primary key. |
| `category_name` | `VARCHAR(80)` | Category label; required and unique. |
| `category_description` | `VARCHAR(255)` | Short explanation of the category; required. |
| `created_at` | `DATETIME` | Row creation time; required, defaults to the current timestamp. |

### `evaluations`

| Column | MySQL type | Meaning / constraints |
|---|---|---|
| `evaluation_id` | `BIGINT UNSIGNED` | Primary key for the evaluation record. |
| `evaluated_at` | `DATETIME` | Time the evaluation was completed; required. |
| `model_version` | `VARCHAR(40)` | Fictional model/version label; required. |
| `use_case` | `VARCHAR(100)` | Fictional response use case; required. |
| `category_id` | `SMALLINT UNSIGNED` | Required foreign key to `evaluation_categories.category_id`; category deletion is restricted. |
| `reviewer_id` | `INT UNSIGNED` | Required foreign key to `reviewers.reviewer_id`; reviewer deletion is restricted. |
| `outcome` | `ENUM('APPROVED', 'NEEDS_REVISION', 'REJECTED')` | Required final review outcome. |
| `error_detected` | `BOOLEAN` | Required record-level indicator for at least one detected error; defaults to `FALSE`. |
| `quality_score` | `DECIMAL(3,2)` | Required score from 1.00 through 5.00, inclusive. |
| `review_minutes` | `DECIMAL(6,2)` | Required review duration in minutes; must be non-negative. |
| `created_at` | `DATETIME` | Row creation time; required, defaults to the current timestamp. |

## Relationships and metric notes

- One reviewer can complete many evaluations; every evaluation references one reviewer.
- One category can classify many evaluations; every evaluation references one category.
- Rates in `sql/04_quality_analysis.sql` are percentages on a 0–100 scale and are rounded to two decimal places.
- Monthly trends group by calendar month using `evaluated_at`.
- Reviewer productivity reports counts and average recorded review duration. It does not imply a quality ranking.
- Foreign keys use `RESTRICT` on delete to preserve evaluation history. There are no personal, customer, prompt, or response-content fields.

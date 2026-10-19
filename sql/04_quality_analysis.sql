-- Example analysis queries. Rates are percentages of evaluation records.
USE ai_quality_analytics;

-- 1. Overall evaluation volume.
SELECT COUNT(*) AS total_evaluations
FROM evaluations;

-- 2. Overall approval rate: approved records / all records.
SELECT
    COUNT(*) AS total_evaluations,
    SUM(outcome = 'APPROVED') AS approved_evaluations,
    ROUND(100.0 * SUM(outcome = 'APPROVED') / NULLIF(COUNT(*), 0), 2) AS approval_rate_pct
FROM evaluations;

-- 3. Record-level error rate: flagged records / all records.
SELECT
    COUNT(*) AS total_evaluations,
    SUM(error_detected) AS evaluations_with_error,
    ROUND(100.0 * SUM(error_detected) / NULLIF(COUNT(*), 0), 2) AS error_rate_pct
FROM evaluations;

-- 4. Outcomes, error rate, and average score by category (including empty categories).
SELECT
    c.category_name,
    COUNT(e.evaluation_id) AS total_evaluations,
    SUM(e.outcome = 'APPROVED') AS approved_evaluations,
    ROUND(100.0 * SUM(e.outcome = 'APPROVED') / NULLIF(COUNT(e.evaluation_id), 0), 2) AS approval_rate_pct,
    SUM(e.error_detected) AS evaluations_with_error,
    ROUND(100.0 * SUM(e.error_detected) / NULLIF(COUNT(e.evaluation_id), 0), 2) AS error_rate_pct,
    ROUND(AVG(e.quality_score), 2) AS average_quality_score
FROM evaluation_categories AS c
LEFT JOIN evaluations AS e ON e.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

-- 5. Reviewer activity and average recorded review duration.
SELECT
    r.reviewer_id,
    r.reviewer_name,
    r.team_name,
    COUNT(e.evaluation_id) AS evaluations_completed,
    ROUND(AVG(e.review_minutes), 2) AS average_review_minutes
FROM reviewers AS r
LEFT JOIN evaluations AS e ON e.reviewer_id = r.reviewer_id
GROUP BY r.reviewer_id, r.reviewer_name, r.team_name
ORDER BY evaluations_completed DESC, r.reviewer_name;

-- 6. Monthly quality trend based on the evaluation completion timestamp.
SELECT
    DATE_FORMAT(evaluated_at, '%Y-%m') AS evaluation_month,
    COUNT(*) AS total_evaluations,
    SUM(outcome = 'APPROVED') AS approved_evaluations,
    ROUND(100.0 * SUM(outcome = 'APPROVED') / NULLIF(COUNT(*), 0), 2) AS approval_rate_pct,
    SUM(error_detected) AS evaluations_with_error,
    ROUND(100.0 * SUM(error_detected) / NULLIF(COUNT(*), 0), 2) AS error_rate_pct,
    ROUND(AVG(quality_score), 2) AS average_quality_score
FROM evaluations
GROUP BY YEAR(evaluated_at), MONTH(evaluated_at), DATE_FORMAT(evaluated_at, '%Y-%m')
ORDER BY YEAR(evaluated_at), MONTH(evaluated_at);

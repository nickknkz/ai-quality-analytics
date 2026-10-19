-- Fictional sample records only. Intended for a newly created schema.
USE ai_quality_analytics;

INSERT INTO reviewers (reviewer_id, reviewer_name, team_name, is_active) VALUES
    (1, 'Alex Morgan', 'Language Quality', TRUE),
    (2, 'Jordan Lee', 'Safety Review', TRUE),
    (3, 'Casey Rivera', 'Knowledge Quality', TRUE),
    (4, 'Taylor Quinn', 'Language Quality', FALSE);

INSERT INTO evaluation_categories (category_id, category_name, category_description) VALUES
    (1, 'Factuality', 'Checks whether claims are supported and factually consistent.'),
    (2, 'Safety', 'Checks for harmful, disallowed, or unsafe response content.'),
    (3, 'Helpfulness', 'Checks relevance, completeness, and usefulness to the request.'),
    (4, 'Instruction Following', 'Checks whether the response follows the stated task and format.');

INSERT INTO evaluations
    (evaluation_id, evaluated_at, model_version, use_case, category_id, reviewer_id,
     outcome, error_detected, quality_score, review_minutes)
VALUES
    (1001, '2026-01-05 09:15:00', 'Atlas-1.2', 'Product FAQ', 1, 1, 'APPROVED', FALSE, 4.70, 6.50),
    (1002, '2026-01-07 10:20:00', 'Atlas-1.2', 'Health information', 2, 2, 'NEEDS_REVISION', TRUE, 2.80, 12.00),
    (1003, '2026-01-10 14:05:00', 'Atlas-1.2', 'Travel planning', 3, 3, 'APPROVED', FALSE, 4.30, 7.25),
    (1004, '2026-01-14 11:40:00', 'Atlas-1.2', 'Email drafting', 4, 4, 'APPROVED', FALSE, 4.50, 5.00),
    (1005, '2026-01-19 16:10:00', 'Atlas-1.2', 'Product FAQ', 1, 2, 'REJECTED', TRUE, 1.90, 15.50),
    (1006, '2026-01-23 08:55:00', 'Atlas-1.2', 'Travel planning', 3, 1, 'NEEDS_REVISION', TRUE, 3.20, 9.00),
    (1007, '2026-02-02 09:30:00', 'Atlas-1.3', 'Email drafting', 4, 3, 'APPROVED', FALSE, 4.80, 4.75),
    (1008, '2026-02-04 13:00:00', 'Atlas-1.3', 'Health information', 2, 2, 'APPROVED', FALSE, 4.20, 8.50),
    (1009, '2026-02-08 10:10:00', 'Atlas-1.3', 'Product FAQ', 1, 1, 'NEEDS_REVISION', TRUE, 3.10, 10.25),
    (1010, '2026-02-11 15:45:00', 'Atlas-1.3', 'Travel planning', 3, 4, 'APPROVED', FALSE, 4.60, 6.00),
    (1011, '2026-02-16 12:20:00', 'Atlas-1.3', 'Health information', 2, 3, 'REJECTED', TRUE, 2.00, 14.00),
    (1012, '2026-02-21 09:05:00', 'Atlas-1.3', 'Email drafting', 4, 2, 'APPROVED', FALSE, 4.40, 5.50),
    (1013, '2026-02-25 17:15:00', 'Atlas-1.3', 'Product FAQ', 1, 3, 'APPROVED', FALSE, 4.50, 7.00),
    (1014, '2026-03-03 08:40:00', 'Atlas-1.3', 'Travel planning', 3, 1, 'APPROVED', FALSE, 4.70, 6.25),
    (1015, '2026-03-06 11:25:00', 'Atlas-1.3', 'Health information', 2, 2, 'NEEDS_REVISION', TRUE, 3.00, 11.75),
    (1016, '2026-03-09 14:30:00', 'Atlas-1.3', 'Email drafting', 4, 4, 'APPROVED', FALSE, 4.60, 5.25),
    (1017, '2026-03-12 10:00:00', 'Atlas-1.3', 'Product FAQ', 1, 1, 'APPROVED', FALSE, 4.80, 6.00),
    (1018, '2026-03-15 16:35:00', 'Atlas-1.3', 'Health information', 2, 3, 'REJECTED', TRUE, 1.80, 16.00),
    (1019, '2026-03-19 09:50:00', 'Atlas-1.3', 'Travel planning', 3, 2, 'APPROVED', FALSE, 4.40, 7.50),
    (1020, '2026-03-24 13:10:00', 'Atlas-1.3', 'Email drafting', 4, 1, 'NEEDS_REVISION', TRUE, 3.40, 8.75),
    (1021, '2026-04-02 10:25:00', 'Atlas-1.4', 'Health information', 2, 2, 'APPROVED', FALSE, 4.50, 8.00),
    (1022, '2026-04-05 15:00:00', 'Atlas-1.4', 'Product FAQ', 1, 3, 'APPROVED', FALSE, 4.80, 5.75),
    (1023, '2026-04-08 09:35:00', 'Atlas-1.4', 'Travel planning', 3, 4, 'NEEDS_REVISION', TRUE, 3.30, 9.50),
    (1024, '2026-04-12 12:45:00', 'Atlas-1.4', 'Email drafting', 4, 1, 'APPROVED', FALSE, 4.90, 4.50),
    (1025, '2026-04-16 14:15:00', 'Atlas-1.4', 'Health information', 2, 3, 'APPROVED', FALSE, 4.60, 7.25),
    (1026, '2026-04-20 08:30:00', 'Atlas-1.4', 'Product FAQ', 1, 2, 'REJECTED', TRUE, 2.10, 13.25),
    (1027, '2026-04-23 11:55:00', 'Atlas-1.4', 'Travel planning', 3, 1, 'APPROVED', FALSE, 4.70, 6.75),
    (1028, '2026-04-27 16:20:00', 'Atlas-1.4', 'Email drafting', 4, 4, 'APPROVED', FALSE, 4.80, 5.00),
    (1029, '2026-05-03 09:10:00', 'Atlas-1.4', 'Product FAQ', 1, 1, 'APPROVED', FALSE, 4.90, 5.50),
    (1030, '2026-05-07 13:40:00', 'Atlas-1.4', 'Health information', 2, 2, 'NEEDS_REVISION', TRUE, 3.20, 10.50),
    (1031, '2026-05-11 10:50:00', 'Atlas-1.4', 'Travel planning', 3, 3, 'APPROVED', FALSE, 4.60, 6.50),
    (1032, '2026-05-15 15:30:00', 'Atlas-1.4', 'Email drafting', 4, 4, 'APPROVED', FALSE, 4.90, 4.25),
    (1033, '2026-05-19 08:45:00', 'Atlas-1.4', 'Product FAQ', 1, 2, 'NEEDS_REVISION', TRUE, 3.50, 9.25),
    (1034, '2026-05-23 12:05:00', 'Atlas-1.4', 'Health information', 2, 1, 'APPROVED', FALSE, 4.70, 7.00),
    (1035, '2026-05-28 17:00:00', 'Atlas-1.4', 'Travel planning', 3, 3, 'APPROVED', FALSE, 4.80, 6.00),
    (1036, '2026-06-04 09:25:00', 'Atlas-1.5', 'Email drafting', 4, 4, 'APPROVED', FALSE, 4.90, 4.75),
    (1037, '2026-06-09 11:15:00', 'Atlas-1.5', 'Health information', 2, 2, 'REJECTED', TRUE, 2.20, 14.50),
    (1038, '2026-06-14 14:55:00', 'Atlas-1.5', 'Product FAQ', 1, 1, 'APPROVED', FALSE, 4.80, 5.75),
    (1039, '2026-06-20 10:35:00', 'Atlas-1.5', 'Travel planning', 3, 3, 'NEEDS_REVISION', TRUE, 3.40, 8.50),
    (1040, '2026-06-26 16:05:00', 'Atlas-1.5', 'Email drafting', 4, 2, 'APPROVED', FALSE, 4.70, 5.25);

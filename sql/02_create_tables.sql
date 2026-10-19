-- Relational schema for fictional AI response quality evaluations.
USE ai_quality_analytics;

CREATE TABLE IF NOT EXISTS reviewers (
    reviewer_id INT UNSIGNED NOT NULL,
    reviewer_name VARCHAR(100) NOT NULL,
    team_name VARCHAR(80) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (reviewer_id),
    CONSTRAINT chk_reviewers_name_nonempty CHECK (CHAR_LENGTH(TRIM(reviewer_name)) > 0)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS evaluation_categories (
    category_id SMALLINT UNSIGNED NOT NULL,
    category_name VARCHAR(80) NOT NULL,
    category_description VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id),
    CONSTRAINT uq_evaluation_categories_name UNIQUE (category_name),
    CONSTRAINT chk_categories_name_nonempty CHECK (CHAR_LENGTH(TRIM(category_name)) > 0)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS evaluations (
    evaluation_id BIGINT UNSIGNED NOT NULL,
    evaluated_at DATETIME NOT NULL,
    model_version VARCHAR(40) NOT NULL,
    use_case VARCHAR(100) NOT NULL,
    category_id SMALLINT UNSIGNED NOT NULL,
    reviewer_id INT UNSIGNED NOT NULL,
    outcome ENUM('APPROVED', 'NEEDS_REVISION', 'REJECTED') NOT NULL,
    error_detected BOOLEAN NOT NULL DEFAULT FALSE,
    quality_score DECIMAL(3,2) NOT NULL,
    review_minutes DECIMAL(6,2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (evaluation_id),
    KEY idx_evaluations_evaluated_at (evaluated_at),
    KEY idx_evaluations_category_id (category_id),
    KEY idx_evaluations_reviewer_id (reviewer_id),
    CONSTRAINT fk_evaluations_category
        FOREIGN KEY (category_id) REFERENCES evaluation_categories (category_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_evaluations_reviewer
        FOREIGN KEY (reviewer_id) REFERENCES reviewers (reviewer_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_evaluations_quality_score CHECK (quality_score BETWEEN 1.00 AND 5.00),
    CONSTRAINT chk_evaluations_review_minutes CHECK (review_minutes >= 0),
    CONSTRAINT chk_evaluations_model_nonempty CHECK (CHAR_LENGTH(TRIM(model_version)) > 0),
    CONSTRAINT chk_evaluations_use_case_nonempty CHECK (CHAR_LENGTH(TRIM(use_case)) > 0)
) ENGINE = InnoDB;

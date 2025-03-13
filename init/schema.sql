-- Create database if not exists
CREATE DATABASE IF NOT EXISTS jobs_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jobs_db;

-- Jobs table with FULLTEXT indexes
CREATE TABLE jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    media_id INT,
    job_category_id INT NOT NULL,
    job_type_id INT NOT NULL,
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location TEXT,
    activity TEXT,
    academic_degree_doctor BOOLEAN,
    academic_degree_master BOOLEAN,
    academic_degree_professional BOOLEAN,
    academic_degree_bachelor BOOLEAN,
    salary_statistic_group VARCHAR(255),
    salary_range_first_year VARCHAR(255),
    salary_range_average VARCHAR(255),
    salary_range_remarks TEXT,
    restriction TEXT,
    estimated_total_workers INT,
    remarks TEXT,
    url VARCHAR(255),
    seo_description TEXT,
    seo_keywords TEXT,
    sort_order INT DEFAULT 0,
    publish_status TINYINT DEFAULT 1,
    version INT DEFAULT 1,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_jobs_search (name, description, detail, business_skill, knowledge, 
                             location, activity, salary_statistic_group, 
                             salary_range_remarks, restriction, remarks),
    INDEX idx_category_type (job_category_id, job_type_id),
    INDEX idx_publish_deleted (publish_status, deleted),
    INDEX idx_sort (sort_order, id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Job Categories table
CREATE TABLE job_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_category_name (name),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Job Types table
CREATE TABLE job_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    job_category_id INT NOT NULL,
    sort_order INT DEFAULT 0,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_type_name (name),
    INDEX idx_category (job_category_id),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Personalities table
CREATE TABLE personalities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_personality_name (name),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Personalities junction table
CREATE TABLE jobs_personalities (
    job_id INT NOT NULL,
    personality_id INT NOT NULL,
    PRIMARY KEY (job_id, personality_id),
    INDEX idx_personality (personality_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Practical Skills table
CREATE TABLE practical_skills (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_skill_name (name),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Practical Skills junction table
CREATE TABLE jobs_practical_skills (
    job_id INT NOT NULL,
    practical_skill_id INT NOT NULL,
    PRIMARY KEY (job_id, practical_skill_id),
    INDEX idx_skill (practical_skill_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Basic Abilities table
CREATE TABLE basic_abilities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_ability_name (name),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Basic Abilities junction table
CREATE TABLE jobs_basic_abilities (
    job_id INT NOT NULL,
    basic_ability_id INT NOT NULL,
    PRIMARY KEY (job_id, basic_ability_id),
    INDEX idx_ability (basic_ability_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Affiliates table (for Tools, Career Paths, and Qualifications)
CREATE TABLE affiliates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type TINYINT NOT NULL COMMENT '1=Tool, 2=Qualification, 3=CareerPath',
    deleted DATETIME DEFAULT NULL,
    FULLTEXT idx_affiliate_name (name),
    INDEX idx_type_deleted (type, deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Tools junction table
CREATE TABLE jobs_tools (
    job_id INT NOT NULL,
    affiliate_id INT NOT NULL,
    PRIMARY KEY (job_id, affiliate_id),
    INDEX idx_tool (affiliate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Career Paths junction table
CREATE TABLE jobs_career_paths (
    job_id INT NOT NULL,
    affiliate_id INT NOT NULL,
    PRIMARY KEY (job_id, affiliate_id),
    INDEX idx_career_path (affiliate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Required Qualifications junction table
CREATE TABLE jobs_req_qualifications (
    job_id INT NOT NULL,
    affiliate_id INT NOT NULL,
    PRIMARY KEY (job_id, affiliate_id),
    INDEX idx_qualification (affiliate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Jobs-Recommended Qualifications junction table
CREATE TABLE jobs_rec_qualifications (
    job_id INT NOT NULL,
    affiliate_id INT NOT NULL,
    PRIMARY KEY (job_id, affiliate_id),
    INDEX idx_qualification (affiliate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

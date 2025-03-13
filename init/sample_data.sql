-- Sample data for testing
USE jobs_db;

-- Job Categories
INSERT INTO job_categories (id, name, sort_order) VALUES
(1, '航空業界', 1),
(2, 'ホスピタリティ', 2),
(3, '運輸・物流', 3);

-- Job Types
INSERT INTO job_types (id, name, job_category_id, sort_order) VALUES
(1, 'キャビンアテンダント', 1, 1),
(2, 'グランドスタッフ', 1, 2),
(3, 'ホテルスタッフ', 2, 1);

-- Personalities
INSERT INTO personalities (id, name) VALUES
(1, 'コミュニケーション力が高い'),
(2, 'チームワーク重視'),
(3, '異文化に興味がある'),
(4, '責任感が強い');

-- Practical Skills
INSERT INTO practical_skills (id, name) VALUES
(1, '英語コミュニケーション'),
(2, '接客サービス'),
(3, '安全管理'),
(4, '緊急時対応');

-- Basic Abilities
INSERT INTO basic_abilities (id, name) VALUES
(1, '語学力'),
(2, 'ホスピタリティ'),
(3, '状況判断力'),
(4, '接客マナー');

-- Affiliates (Tools, Qualifications, Career Paths)
INSERT INTO affiliates (id, name, type) VALUES
(1, '機内安全機器', 1),              -- Tool
(2, '救急救命士資格', 2),            -- Qualification
(3, '英語検定準1級', 2),             -- Qualification
(4, '客室乗務課長', 3),              -- Career Path
(5, 'サービス統括マネージャー', 3);  -- Career Path

-- Jobs
INSERT INTO jobs (
    id, name, job_category_id, job_type_id, description, detail,
    business_skill, knowledge, location, activity,
    salary_range_first_year, salary_range_average, sort_order, publish_status
) VALUES
(1, '国際線キャビンアテンダント', 1, 1,
    'グローバルに活躍するキャビンアテンダントとして、安全で快適な空の旅を提供します。',
    '世界各地への航空便で、機内サービスと安全管理を担当するキャビンアテンダントを募集しています。',
    '・接客サービス技能\n・異文化コミュニケーション\n・緊急時対応能力',
    '・航空安全規則\n・機内サービス基準\n・救急救命処置',
    '東京（羽田・成田）',
    '・機内安全確認\n・機内サービス提供\n・緊急時対応',
    '350万円', '450万円', 100, 1),

(2, '国内線キャビンアテンダント', 1, 1,
    '国内線で活躍するキャビンアテンダントとして、安心・安全な空の旅をお届けします。',
    '国内線での機内サービスと安全管理を担当するキャビンアテンダントを募集します。',
    '・接客サービス技能\n・コミュニケーション能力\n・安全管理能力',
    '・航空安全規則\n・機内サービス基準\n・接客マナー',
    '大阪（伊丹）',
    '・機内安全確認\n・機内サービス提供\n・搭乗案内',
    '320万円', '400万円', 90, 1),

(3, 'ホテルフロントスタッフ', 2, 3,
    '5つ星ホテルでのフロントスタッフとして、最高級のおもてなしを提供。',
    '国際的な高級ホテルでのフロントスタッフとして、チェックインからチェックアウトまで様々なサービスを提供します。',
    '・接客サービス\n・予約管理\n・問題解決能力',
    '・ホテル運営知識\n・接客マナー\n・予約システム',
    '東京都内',
    '・チェックイン/アウト対応\n・予約管理\n・お客様対応',
    '280万円', '350万円', 80, 1);

-- Jobs-Personalities relationships
INSERT INTO jobs_personalities (job_id, personality_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 1), (2, 2), (2, 4),
(3, 1), (3, 2);

-- Jobs-Practical Skills relationships
INSERT INTO jobs_practical_skills (job_id, practical_skill_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 2), (2, 3), (2, 4),
(3, 1), (3, 2);

-- Jobs-Basic Abilities relationships
INSERT INTO jobs_basic_abilities (job_id, basic_ability_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 2), (2, 3), (2, 4),
(3, 2), (3, 4);

-- Jobs-Tools relationships
INSERT INTO jobs_tools (job_id, affiliate_id) VALUES
(1, 1),
(2, 1);

-- Jobs-Career Paths relationships
INSERT INTO jobs_career_paths (job_id, affiliate_id) VALUES
(1, 4), (1, 5),
(2, 4);

-- Jobs-Required Qualifications relationships
INSERT INTO jobs_req_qualifications (job_id, affiliate_id) VALUES
(1, 2), (1, 3),
(2, 2);

-- Jobs-Recommended Qualifications relationships
INSERT INTO jobs_rec_qualifications (job_id, affiliate_id) VALUES
(1, 3),
(2, 3);

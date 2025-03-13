
SELECT DISTINCT 
    Jobs.id AS `Jobs__id`,
    Jobs.name AS `Jobs__name`,
    Jobs.media_id AS `Jobs__media_id`,
    Jobs.job_category_id AS `Jobs__job_category_id`,
    Jobs.job_type_id AS `Jobs__job_type_id`,
    Jobs.description AS `Jobs__description`,
    Jobs.detail AS `Jobs__detail`,
    Jobs.business_skill AS `Jobs__business_skill`,
    Jobs.knowledge AS `Jobs__knowledge`,
    Jobs.location AS `Jobs__location`,
    Jobs.activity AS `Jobs__activity`,
    Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
    Jobs.academic_degree_master AS `Jobs__academic_degree_master`,
    Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
    Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
    Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
    Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
    Jobs.salary_range_average AS `Jobs__salary_range_average`,
    Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
    Jobs.restriction AS `Jobs__restriction`,
    Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
    Jobs.remarks AS `Jobs__remarks`,
    Jobs.url AS `Jobs__url`,
    Jobs.sort_order AS `Jobs__sort_order`,
    Jobs.publish_status AS `Jobs__publish_status`,
    JobCategories.id AS `JobCategories__id`,
    JobCategories.name AS `JobCategories__name`,
    JobTypes.id AS `JobTypes__id`,
    JobTypes.name AS `JobTypes__name`
FROM jobs Jobs
    INNER JOIN job_categories JobCategories ON JobCategories.id = Jobs.job_category_id 
        AND JobCategories.deleted IS NULL
    INNER JOIN job_types JobTypes ON JobTypes.id = Jobs.job_type_id 
        AND JobTypes.deleted IS NULL
    LEFT JOIN (
        SELECT DISTINCT job_id 
        FROM jobs_personalities jp 
        INNER JOIN personalities p ON p.id = jp.personality_id 
            AND p.deleted IS NULL 
            AND p.name LIKE '%キャビンアテンダント%'
    ) matching_personalities ON matching_personalities.job_id = Jobs.id
    LEFT JOIN (
        SELECT DISTINCT job_id 
        FROM jobs_practical_skills jps 
        INNER JOIN practical_skills ps ON ps.id = jps.practical_skill_id 
            AND ps.deleted IS NULL 
            AND ps.name LIKE '%キャビンアテンダント%'
    ) matching_skills ON matching_skills.job_id = Jobs.id
    LEFT JOIN (
        SELECT DISTINCT job_id 
        FROM jobs_basic_abilities jba 
        INNER JOIN basic_abilities ba ON ba.id = jba.basic_ability_id 
            AND ba.deleted IS NULL 
            AND ba.name LIKE '%キャビンアテンダント%'
    ) matching_abilities ON matching_abilities.job_id = Jobs.id
    LEFT JOIN (
        SELECT DISTINCT job_id 
        FROM jobs_tools jt 
        INNER JOIN affiliates a ON a.id = jt.affiliate_id 
            AND a.type = 1 
            AND a.deleted IS NULL 
            AND a.name LIKE '%キャビンアテンダント%'
    ) matching_tools ON matching_tools.job_id = Jobs.id
WHERE 
    Jobs.deleted IS NULL
    AND Jobs.publish_status = 1
    AND (
        Jobs.name LIKE '%キャビンアテンダント%'
        OR Jobs.description LIKE '%キャビンアテンダント%'
        OR Jobs.detail LIKE '%キャビンアテンダント%'
        OR Jobs.business_skill LIKE '%キャビンアテンダント%'
        OR Jobs.knowledge LIKE '%キャビンアテンダント%'
        OR Jobs.location LIKE '%キャビンアテンダント%'
        OR Jobs.activity LIKE '%キャビンアテンダント%'
        OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%'
        OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%'
        OR Jobs.restriction LIKE '%キャビンアテンダント%'
        OR Jobs.remarks LIKE '%キャビンアテンダント%'
        OR JobCategories.name LIKE '%キャビンアテンダント%'
        OR JobTypes.name LIKE '%キャビンアテンダント%'
        OR matching_personalities.job_id IS NOT NULL
        OR matching_skills.job_id IS NOT NULL
        OR matching_abilities.job_id IS NOT NULL
        OR matching_tools.job_id IS NOT NULL
    )
ORDER BY 
    Jobs.sort_order DESC,
    Jobs.id DESC 
LIMIT 50;

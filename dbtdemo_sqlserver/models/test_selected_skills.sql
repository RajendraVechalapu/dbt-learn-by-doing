

WITH base AS (
    SELECT
        Skill,
        Module,
        Topic
    FROM [voc].[kb].[SelectedSkills]
),

-- 1. Identify any rows where Skill, Module, or Topic is NULL or blank
null_or_blank_check AS (
    SELECT *
    FROM base
    WHERE Skill IS NULL OR LTRIM(RTRIM(Skill)) = ''
       OR Module IS NULL OR LTRIM(RTRIM(Module)) = ''
       OR Topic IS NULL OR LTRIM(RTRIM(Topic)) = ''
),

-- 2. Summarize the number of distinct Modules and Topics per Skill
summary AS (
    SELECT
        Skill,
        COUNT(DISTINCT Module) AS distinct_module_count,
        COUNT(DISTINCT Topic) AS distinct_topic_count
    FROM base
    WHERE Skill IS NOT NULL AND LTRIM(RTRIM(Skill)) <> ''
    GROUP BY Skill
)

-- 3. Combine both outputs
SELECT * FROM null_or_blank_check
UNION ALL
SELECT
    Skill,
    CAST(distinct_module_count AS VARCHAR) AS Module,
    CAST(distinct_topic_count AS VARCHAR) AS Topic
FROM summary

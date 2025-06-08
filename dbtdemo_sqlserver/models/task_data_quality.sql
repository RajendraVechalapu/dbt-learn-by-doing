{{ config(materialized='table', schema='dqi') }}

WITH base AS (
    SELECT
        TaskId,
        TaskName,
        TaskDesc,
        Status,
        TargetCompletionDate,
        CreatedAt,
        LastTimeRun
    FROM [voc].[kb].[Tasks]
),

-- 🔁 Duplicate Task Names
duplicate_tasknames AS (
    SELECT
        TaskName,
        COUNT(*) AS name_count
    FROM base
    WHERE LTRIM(RTRIM(TaskName)) IS NOT NULL
    GROUP BY TaskName
    HAVING COUNT(*) > 1
),

-- ❗ Null or Blank TargetCompletionDates
invalid_completion_dates AS (
    SELECT *
    FROM base
    WHERE TargetCompletionDate IS NULL
       OR TRY_CAST(TargetCompletionDate AS VARCHAR) = ''
)

-- 🧾 Final Combined Report
SELECT 
    'DUPLICATE' AS issue_type,
    b.*
FROM base b
JOIN duplicate_tasknames d ON b.TaskName = d.TaskName

UNION ALL

SELECT
    'MISSING_DATE' AS issue_type,
    *
FROM invalid_completion_dates

{{ config(
    materialized='table',
    schema='dwh'
) }}

WITH source AS (
    SELECT *
    FROM {{ ref('stg_account') }}
),

-- Apply SCD2-style logic (e.g., deduplicate, apply row_number)
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY AccountID ORDER BY LastUpdated DESC) AS rn
    FROM source
),

latest AS (
    SELECT *
    FROM ranked
    WHERE rn = 1
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['AccountID']) }} AS account_key,
    AccountID,
    AccountName,
    AccountType,
    Status,
    LastUpdated AS EffectiveFromDate
FROM latest

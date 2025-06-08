-- Enforce schema-level override at model level
{{ config(
    materialized='table'
) }}

WITH src AS (
    SELECT
        AccountID,
        AccountName,
        AccountType,
        Status,
        LastUpdated
    FROM {{ source('raw', 'account') }}
)

SELECT
    AccountID,
    AccountName,
    AccountType,
    Status,
    LastUpdated,
    current_timestamp AS ingestion_timestamp
FROM src

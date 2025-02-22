{{ config(materialized='table') }}

SELECT 
    keyword, 
    explanation
FROM public.faq_skill_keywords
WHERE 
    explanation IS NOT NULL 
    AND TRIM(explanation) <> ''

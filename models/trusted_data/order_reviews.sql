{{ config(materialized="table") }}

SELECT
    REVIEW_ID,
    ORDER_ID,
    REVIEW_SCORE,
    COALESCE(REVIEW_COMMENT_TITLE, "") as REVIEW_COMMENT_TITLE,
    COALESCE(REVIEW_COMMENT_MESSAGE, "") as REVIEW_COMMENT_MESSAGE,
    REVIEW_CREATION_DATE,
    REVIEW_ANSWER_TIMESTAMP
    
FROM {{ source('flachavanne_ecommerce_raw2', 'order_reviews') }}
where ORDER_ID is not null and REVIEW_ID is not null and REVIEW_SCORE is not null
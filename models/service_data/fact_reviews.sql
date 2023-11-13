{{ config(materialized="table") }}

SELECT
    r.REVIEW_ID,
    r.ORDER_ID,
    r.REVIEW_SCORE,
    r.REVIEW_COMMENT_TITLE,
    r.REVIEW_COMMENT_MESSAGE,
    r.REVIEW_CREATION_DATE,
    r.REVIEW_ANSWER_TIMESTAMP,
    o.CUSTOMER_ID,
    o.ORDER_STATUS,
    o.ORDER_PURCHASE_TIMESTAMP,
    o.ORDER_APPROVED_AT,
    o.ORDER_DELIVERED_CARRIER_DATE,
    o.ORDER_DELIVERED_CUSTOMER_DATE,
    o.ORDER_ESTIMATED_DELIVERY_DATE,
    MAX(r.REVIEW_SCORE) OVER (PARTITION BY r.ORDER_ID ORDER BY r.REVIEW_CREATION_DATE DESC) AS latest_review_score,
    MIN(r.REVIEW_SCORE) OVER (PARTITION BY r.ORDER_ID ORDER BY r.REVIEW_CREATION_DATE DESC) AS first_review_score,
    MAX(r.REVIEW_SCORE) OVER (PARTITION BY r.ORDER_ID) - MIN(r.REVIEW_SCORE) OVER (PARTITION BY r.ORDER_ID) AS score_difference


FROM {{ ref('order_reviews') }} r
LEFT JOIN {{ ref('orders') }} o ON o.order_id = r.ORDER_ID
WHERE ORDER_STATUS = 'DELIVERED' and r.REVIEW_CREATION_DATE > o.ORDER_DELIVERED_CUSTOMER_DATE
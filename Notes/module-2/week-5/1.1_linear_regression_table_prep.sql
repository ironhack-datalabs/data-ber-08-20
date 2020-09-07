USE olist;

CREATE TABLE temp_dedup_order_reviews AS (
    SELECT
        order_id,
        MAX(review_score) AS review_score
    FROM order_reviews
    GROUP BY 1);

CREATE TABLE temp_order_item_details AS (
    SELECT
        oi.order_id,
        SUM(oi.price)           AS total_price,
        SUM(oi.freight_value)   AS shipping_costs,
        COUNT(1)                AS order_size,
        SUM(CASE
            WHEN p.product_photos_qty > 0 THEN 1
            ELSE 0
        END)                    AS has_product_photo,
        SUM(CASE
            WHEN p.product_description_length > 0 THEN 1
            ELSE 0
        END)                    AS has_product_decription
    FROM order_items oi
        LEFT JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY 1);

CREATE INDEX temp_dedup_order_reviews_order_id ON temp_dedup_order_reviews (order_id(20));
CREATE INDEX temp_order_item_details_order_id ON temp_order_item_details (order_id(20));

# Query for notebook
SELECT
    o.order_id,
    dor.review_score,
    DATEDIFF(DATE(o.order_estimated_delivery_date), DATE(o.order_purchase_timestamp)) AS estimated_delivery_days,
    DATEDIFF(DATE(o.order_delivered_customer_date), DATE(o.order_purchase_timestamp)) AS actual_delivery_days,
    DATEDIFF(DATE(o.order_estimated_delivery_date), DATE(o.order_purchase_timestamp)) -
        DATEDIFF(DATE(o.order_delivered_customer_date), DATE(o.order_purchase_timestamp)) AS delivery_diff,
    oid.total_price,
    oid.shipping_costs,
    oid.order_size,
    oid.has_product_photo,
    oid.has_product_decription
FROM orders o
    JOIN temp_dedup_order_reviews dor
    ON o.order_id = dor.order_id
    JOIN temp_order_item_details oid
    ON o.order_id = oid.order_id
WHERE o.order_status = 'delivered';


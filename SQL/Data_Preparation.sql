SELECT
	row_id,
	
    CASE
        WHEN LEFT(order_id, 2) = 'CA' THEN REPLACE(order_id, 'CA', 'US')
        ELSE order_id
    END AS order_id,

    CAST(
        CASE
            WHEN order_date LIKE '% %' THEN
                REGEXP_REPLACE(SPLIT_PART(order_date, ' ', 1), '(\d{4}).(\d{2}).(\d{2})', '\2-\3-\1', 'g')
            ELSE
                REGEXP_REPLACE(order_date, '(\d{1,2}).(\d{2}).(\d{4})', '\2-\1-\3', 'g')
        END
    AS DATE) AS order_date,

    CAST(
        CASE
            WHEN ship_date LIKE '% %' THEN
                REGEXP_REPLACE(SPLIT_PART(ship_date, ' ', 1), '(\d{4}).(\d{2}).(\d{2})', '\2-\3-\1', 'g')
            ELSE
                REGEXP_REPLACE(ship_date, '(\d{1,2}).(\d{2}).(\d{4})', '\2-\1-\3', 'g')
        END
    AS DATE) AS ship_date,

    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    CAST(quantity AS INT) AS quantity,
    discount,
    profit
FROM
    data.superstore;
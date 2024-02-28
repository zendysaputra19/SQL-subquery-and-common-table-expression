-- impor table restaurant dan orders
SELECT
	*
FROM
	restaurants;
    
SELECT
	*
FROM
	orders;

-- menampilkan restaurant dengan rata-rata order termahal di setiap restaurant menggunakan CTE
WITH avg_order_cte AS (
    SELECT
        restaurant_id,
        AVG(total_order) AS avg_order_amount
    FROM
        orders
    GROUP BY
        restaurant_id
)

SELECT
    id,
    restaurant_name,
    avg_order_cte.avg_order_amount AS average_order_amount
FROM
    restaurants
LEFT JOIN
    avg_order_cte ON restaurants.id = avg_order_cte.restaurant_id
ORDER BY
    avg_order_cte.avg_order_amount DESC;

-- menampilkan restaurant dengan rata-rata order termahal di setiap restaurant menggunakan subquery
SELECT
    id,
    restaurant_name,
    (
        SELECT AVG(total_order)
        FROM orders
        WHERE orders.restaurant_id = restaurants.id
        GROUP BY restaurant_id
    ) AS average_order_amount
FROM
    restaurants
ORDER BY
    average_order_amount DESC;

-- buat database northwind
SELECT
	*
FROM products;

SELECT
	*
FROM categories;

-- buat query untuk mendapatkan nama produk dengan kategori “Condiments” menggunakan JOIN, CTE, dan Subquery
-- JOIN
SELECT
    products.CategoryID,
    products.ProductName,
    categories.CategoryName
FROM
    products
JOIN
    categories ON products.CategoryID = categories.CategoryID
WHERE
    categories.CategoryName = 'Condiments';
    
-- CTE
WITH product_category_cte AS (
    SELECT
        products.CategoryID,
        products.ProductName,
        categories.CategoryName
    FROM
        products
    JOIN
        categories ON products.CategoryID = categories.CategoryID
)

SELECT
    CategoryID,
    ProductName,
    CategoryName
FROM
    product_category_cte
WHERE
    CategoryName = 'Condiments';

-- subquery
SELECT
    CategoryID,
    ProductName,
    CategoryName
FROM (
    SELECT
        products.CategoryID,
        products.ProductName,
        categories.CategoryName
    FROM
        products
    JOIN
        categories ON products.CategoryID = categories.CategoryID
	) AS subquery_result
WHERE
    CategoryName = 'Condiments';

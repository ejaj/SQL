--Problem Statement
/*
Products Without Sales
 */
--Solution
SELECT product.sku, product.product_name
FROM product
WHERE product.id NOT IN (SELECT product_id FROM invoice_item);
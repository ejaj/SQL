--Problem Statement
/*
Products Sales Per City
 */
--Solution
SELECT invoice.city_name,
product.product_name,
invoice_item.line_total_price
FROM invoice_item as invoice_item
JOIN product as product
ON invoice_item.product_id = product.id
JOIN (
    SELECT invoice.id,
    customer.city_name
    FROM invoice as invoice
    JOIN (
    SELECT customer.id,city.city_name
        FROM customer as customer
        LEFT JOIN city as city
        ON customer.city_id = city.id
    )as customer
    ON invoice.customer_id = customer.id
) as invoice
ON invoice_item.invoice_id = invoice.id
ORDER BY invoice_item.line_total_price DESC

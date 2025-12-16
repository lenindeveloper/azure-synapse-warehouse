SELECT
  customer_id,
  INITCAP(customer_name) AS customer_name,
  email,
  country,
  CAST(created_at AS DATE) AS created_date
FROM raw.customers
WHERE email IS NOT NULL;

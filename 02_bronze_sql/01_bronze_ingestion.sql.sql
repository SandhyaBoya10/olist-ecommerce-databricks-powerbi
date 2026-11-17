CREATE SCHEMA IF NOT EXISTS workspace.olist_bronze;
CREATE SCHEMA IF NOT EXISTS workspace.olist_silver;
CREATE SCHEMA IF NOT EXISTS workspace.olist_gold;
CREATE VOLUME IF NOT EXISTS workspace.olist_bronze.raw_files;





CREATE OR REPLACE TABLE workspace.olist_bronze.orders AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_orders_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.order_items AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_order_items_dataset.csv', format => 'csv', header => true, inferSchema => true);
CREATE OR REPLACE TABLE workspace.olist_bronze.order_payments AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_order_payments_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.order_reviews AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_order_reviews_dataset.csv', format => 'csv', header => true, inferSchema => true, multiLine => true, escape => '"');

CREATE OR REPLACE TABLE workspace.olist_bronze.customers AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_customers_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.products AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_products_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.sellers AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_sellers_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.geolocation AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/olist_geolocation_dataset.csv', format => 'csv', header => true, inferSchema => true);

CREATE OR REPLACE TABLE workspace.olist_bronze.category_translation AS
SELECT * FROM read_files('/Volumes/workspace/olist_bronze/raw_files/product_category_name_translation.csv', format => 'csv', header => true, inferSchema => true);






SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM workspace.olist_bronze.orders
UNION ALL SELECT 'order_items', COUNT(*) FROM workspace.olist_bronze.order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM workspace.olist_bronze.order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM workspace.olist_bronze.order_reviews
UNION ALL SELECT 'customers', COUNT(*) FROM workspace.olist_bronze.customers
UNION ALL SELECT 'products', COUNT(*) FROM workspace.olist_bronze.products
UNION ALL SELECT 'sellers', COUNT(*) FROM workspace.olist_bronze.sellers
UNION ALL SELECT 'geolocation', COUNT(*) FROM workspace.olist_bronze.geolocation
UNION ALL SELECT 'category_translation', COUNT(*) FROM workspace.olist_bronze.category_translation;
	
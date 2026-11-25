-- Practical SQL Queries for QA Engineers (Anton Zverkov)
-- Verified in SQLite / standard ANSI SQL syntax

-- Demo E-Commerce Schema for QA Database Validation
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    city TEXT,
    created_at TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    price REAL NOT NULL,
    stock_qty INTEGER NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    status TEXT NOT NULL,
    total_amount REAL NOT NULL,
    created_at TEXT
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL
);

INSERT INTO users VALUES
(1, 'Somchai K.', 'somchai@example.com', 'Bangkok', '2026-10-01'),
(2, 'Nattapong P.', 'nattapong@example.com', 'Bangkok', '2026-10-05'),
(3, 'Duplicate User', 'somchai@example.com', 'Chiang Mai', '2026-10-10'),
(4, 'Anna S.', 'anna@example.com', 'Bangkok', '2026-10-12');

INSERT INTO products VALUES
(101, 'Sauce Labs Backpack', 29.99, 15),
(102, 'Sauce Labs Bike Light', 9.99, 0),
(103, 'Sauce Labs Bolt T-Shirt', 15.99, 8);

INSERT INTO orders VALUES
(1001, 1, 'PAID', 39.98, '2026-11-01'),
(1002, 2, 'PAID', 0.00, '2026-11-02'),
(1003, 999, 'PENDING', 15.99, '2026-11-03'),
(1004, 1, 'CANCELLED', 29.99, '2026-11-04');

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 29.99),
(2, 1001, 102, 1, 9.99),
(3, 1003, 103, 1, 15.99);

-- ==========================================
-- QA VERIFICATION & BUG-HUNTING QUERIES
-- ==========================================

-- 1. Verify newly registered users in Bangkok (SELECT + WHERE + ORDER BY)
SELECT user_id, full_name, email, created_at
FROM users
WHERE city = 'Bangkok'
ORDER BY created_at DESC;

-- 2. Data Integrity Check: Find duplicate user emails (GROUP BY + HAVING)
SELECT email, COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- 3. Bug Hunt: Find PAID orders with $0.00 total amount (similar to BUG-002)
SELECT order_id, user_id, status, total_amount
FROM orders
WHERE status = 'PAID' AND total_amount <= 0;

-- 4. Orphan Record Check: Orders linked to a non-existent user (LEFT JOIN)
SELECT o.order_id, o.user_id, o.status, o.total_amount
FROM orders o
LEFT JOIN users u ON o.user_id = u.user_id
WHERE u.user_id IS NULL;

-- 5. Checkout Math Check: Compare order total_amount vs sum of order_items (INNER JOIN + GROUP BY)
SELECT
    o.order_id,
    o.total_amount AS recorded_total,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS calculated_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount;

-- 6. Inventory QA Check: Find out-of-stock products
SELECT product_id, product_name, stock_qty
FROM products
WHERE stock_qty = 0;

-- 7. Summary Report: Count orders and revenue by status
SELECT status, COUNT(*) AS order_count, ROUND(SUM(total_amount), 2) AS total_revenue
FROM orders
GROUP BY status
ORDER BY order_count DESC;

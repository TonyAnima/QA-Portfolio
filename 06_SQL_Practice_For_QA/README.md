# SQL Practice for QA Engineers

File: [`QA_SQL_Queries.sql`](./QA_SQL_Queries.sql)

In Manual QA, SQL is used to verify that UI and API actions write accurate data to the database and to catch backend data bugs that are invisible in the browser.

## What These Queries Demonstrate
1. **Filtering & Sorting (`SELECT`, `WHERE`, `ORDER BY`):** Checking user registration records by city and date.
2. **Duplicate Detection (`GROUP BY`, `HAVING`):** Catching duplicate email registrations when unique constraints fail.
3. **Business Logic Validation (`WHERE`):** Detecting invalid `$0.00` `PAID` orders.
4. **Orphan Record Detection (`LEFT JOIN ... WHERE IS NULL`):** Finding orders tied to deleted or non-existent user IDs.
5. **Financial / Checkout Reconciliation (`INNER JOIN`, `SUM`):** Comparing stored `orders.total_amount` against the calculated sum of `order_items`.
6. **Inventory & Status Reporting (`COUNT`, `SUM`, `GROUP BY`):** Validating stock levels and order status breakdowns.

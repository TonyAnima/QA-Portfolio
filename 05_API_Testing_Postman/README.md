# REST API Testing Collection (Postman)

- **Target API:** [JSONPlaceholder Free Fake REST API](https://jsonplaceholder.typicode.com/)
- **Collection File:** [`JSONPlaceholder_API_Collection.postman_collection.json`](./JSONPlaceholder_API_Collection.postman_collection.json)

## How to Run
1. Open **Postman**.
2. Click **Import** and select `JSONPlaceholder_API_Collection.postman_collection.json`.
3. Click **Run collection** (Collection Runner) to execute all 8 requests and verify the automated JavaScript assertions (`pm.test`).

## Covered Scenarios
| # | Method | Endpoint | Check Performed |
| :--- | :--- | :--- | :--- |
| 1 | `GET` | `/posts` | Status 200, array length = 100, response time < 1500ms |
| 2 | `GET` | `/posts/1` | Status 200, JSON keys (`userId`, `id`, `title`, `body`) |
| 3 | `GET` | `/posts?userId=1` | Query parameter filtering accuracy |
| 4 | `GET` | `/posts/1/comments` | Nested route relation & email format check |
| 5 | `POST` | `/posts` | Status 201 Created, payload echo & generated ID |
| 6 | `PUT` | `/posts/1` | Status 200, full resource update verification |
| 7 | `DELETE` | `/posts/1` | Status 200, deletion response check |
| 8 | `GET` | `/posts/999999` | Negative test: Status 404 Not Found & empty JSON `{}` |

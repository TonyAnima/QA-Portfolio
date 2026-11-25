# Test Cases — Swag Labs E-Commerce

- **Target URL:** [https://www.saucedemo.com/](https://www.saucedemo.com/)
- **Total Test Cases:** 15 (12 Pass, 3 Fail — linked to Bug Reports)
- **CSV Export (Jira/TestRail-ready):** [`SwagLabs_Test_Cases.csv`](./SwagLabs_Test_Cases.csv)

| ID | Module | Type | Priority | Title | Steps | Expected Result | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| TC-001 | Authentication | Positive | High | Login with valid standard_user credentials | 1. Enter 'standard_user' in Username<br>2. Enter 'secret_sauce' in Password<br>3. Click 'Login' | User is redirected to /inventory.html and product catalog is visible | **Pass** |
| TC-002 | Authentication | Negative | High | Login attempt with locked_out_user | 1. Enter 'locked_out_user'<br>2. Enter 'secret_sauce'<br>3. Click 'Login' | Error banner appears: 'Epic sadface: Sorry, this user has been locked out.' | **Pass** |
| TC-003 | Authentication | Negative | High | Login with invalid password | 1. Enter 'standard_user'<br>2. Enter 'wrong_pass'<br>3. Click 'Login' | Error banner appears indicating username and password do not match | **Pass** |
| TC-004 | Authentication | Negative | Medium | Login with empty Username field | 1. Leave Username blank<br>2. Enter 'secret_sauce'<br>3. Click 'Login' | Validation error: 'Epic sadface: Username is required' | **Pass** |
| TC-005 | Authentication | Negative | Medium | Login with empty Password field | 1. Enter 'standard_user'<br>2. Leave Password blank<br>3. Click 'Login' | Validation error: 'Epic sadface: Password is required' | **Pass** |
| TC-006 | Authentication | Positive | Medium | Logout clears user session | 1. Open left burger menu<br>2. Click 'Logout'<br>3. Try opening /inventory.html directly | User is returned to login page and blocked from accessing inventory | **Pass** |
| TC-007 | Inventory | Positive | Medium | Sort products by Price (low to high) | 1. Click sort dropdown<br>2. Select 'Price (low to high)' | First item is $7.99 (Sauce Labs Onesie), last item is $49.99 (Fleece Jacket) | **Pass** |
| TC-008 | Inventory | Positive | Medium | Sort products by Name (Z to A) | 1. Click sort dropdown<br>2. Select 'Name (Z to A)' | Products reorder strictly descending from Z to A | **Pass** |
| TC-009 | Cart | Positive | High | Add single product to cart and verify badge | 1. Click 'Add to cart' on Sauce Labs Backpack<br>2. Check cart icon badge | Button changes to 'Remove' and cart badge displays '1' | **Pass** |
| TC-010 | Cart | Positive | High | Remove product from cart on Cart page | 1. Click cart icon<br>2. Click 'Remove' next to item | Item is removed from list and cart badge disappears | **Pass** |
| TC-011 | Checkout | Positive | High | Complete end-to-end checkout with 2 items | 1. Open Cart -> Click 'Checkout'<br>2. Fill First Name, Last Name, Postal Code -> 'Continue'<br>3. Verify subtotal $39.98 + 8% tax $3.20 = $43.18<br>4. Click 'Finish' | Confirmation page 'Thank you for your order!' is shown and cart is empty | **Pass** |
| TC-012 | Checkout | Negative | High | Checkout Step 1 with missing Postal Code | 1. Enter First Name 'Anton' and Last Name 'Zverkov'<br>2. Leave Postal Code empty<br>3. Click 'Continue' | Error message displayed: 'Error: Postal Code is required' | **Pass** |
| TC-013 | Checkout | Negative | Medium | Attempt checkout with empty cart | 1. Open Cart page<br>2. Click 'Checkout'<br>3. Fill valid form and click 'Continue' -> 'Finish' | Expected: Checkout button disabled or error shown. Actual: Order completes with $0.00 (BUG-002) | **Fail** |
| TC-014 | Inventory | Negative | Medium | Verify product sorting for problem_user | 1. Open sort dropdown<br>2. Select 'Price (low to high)' | Expected: Products sort by ascending price. Actual: Order does not change (BUG-001) | **Fail** |
| TC-015 | UI / Visual | Positive | Medium | Verify unique product images in catalog for problem_user | 1. Inspect all 6 product thumbnails<br>2. Check image URLs in Chrome DevTools Elements tab | Expected: Each product shows its matching image. Actual: All products display the same placeholder dog image (BUG-003) | **Fail** |

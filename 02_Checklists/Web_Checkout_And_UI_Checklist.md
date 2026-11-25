# Smoke, Functional & UI Checklist — Swag Labs E-Commerce

- **Target URL:** [https://www.saucedemo.com/](https://www.saucedemo.com/)
- **Browser:** Google Chrome (Desktop 1440×900 & Mobile 390×844 via DevTools)

## 1. Authentication (Smoke)
- [x] Login with valid credentials (`standard_user` / `secret_sauce`) redirects to `/inventory.html`
- [x] Login with `locked_out_user` displays clear error message (`Sorry, this user has been locked out.`)
- [x] Login with invalid password shows error and does not grant access
- [x] Login with empty Username or Password triggers required-field error
- [x] Logout from burger menu clears session and blocks direct access to `/inventory.html`

## 2. Inventory & Sorting
- [x] All 6 products render with title, description, price, image, and `Add to cart` button
- [x] Sort `Name (A to Z)` orders products alphabetically ascending
- [x] Sort `Name (Z to A)` orders products alphabetically descending
- [x] Sort `Price (low to high)` orders from `$7.99` to `$49.99`
- [x] Sort `Price (high to low)` orders from `$49.99` to `$7.99`
- [ ] **Defect observed (`problem_user`):** Sorting dropdown fails to reorder items (see `BUG-001`)

## 3. Shopping Cart
- [x] Clicking `Add to cart` changes button label to `Remove` and increments cart badge
- [x] Clicking `Remove` decrements cart badge and removes badge when count reaches 0
- [x] Cart items persist when navigating to product details and returning to inventory
- [x] Cart page displays exact item names, quantities, and unit prices

## 4. Checkout Flow
- [x] Checkout Step 1 blocks submission when First Name, Last Name, or Postal Code is empty
- [x] Checkout Step 2 accurately calculates `Item total`, `Tax (8%)`, and final `Total`
- [x] Clicking `Finish` displays confirmation page (`Thank you for your order!`) and resets cart badge
- [ ] **Defect observed (`standard_user`):** Checkout can be completed with an empty cart (see `BUG-002`)

## 5. UI & Chrome DevTools Checks
- [x] No horizontal scroll on mobile viewport (390×844)
- [x] DevTools `Console` tab shows no uncaught JS exceptions for `standard_user`
- [x] DevTools `Network` tab shows HTTP 200 for all product assets for `standard_user`
- [ ] **Defect observed (`problem_user`):** Broken/mismatched product images rendered across catalog (see `BUG-003`)

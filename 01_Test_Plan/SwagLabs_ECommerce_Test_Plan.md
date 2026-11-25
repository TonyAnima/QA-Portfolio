# Test Plan: Swag Labs E-Commerce Web Application

- **Application Under Test (AUT):** [Swag Labs (SauceDemo)](https://www.saucedemo.com/)
- **Author:** Anton Zverkov
- **Date:** November 2026
- **Version:** 1.0

## 1. Objective
Verify the core functional, UI, and usability flows of the Swag Labs e-commerce web application to ensure users can log in, browse and sort products, manage the shopping cart, and complete a checkout accurately.

## 2. Scope of Testing

### In Scope
- **Authentication:** Valid login (`standard_user`), locked account (`locked_out_user`), invalid credentials, and empty field validation.
- **Product Catalog & Sorting:** Product list display, images, prices, item detail view, and sorting (A–Z, Z–A, Price Low–High, Price High–Low).
- **Shopping Cart:** Adding/removing items, cart badge counter accuracy, and item persistence across pages.
- **Checkout Flow:** Customer information validation (First Name, Last Name, Postal Code), order summary calculation (Item Total + Tax = Total), and order confirmation.
- **Basic UI & Browser Console:** Responsive layout check and absence of critical JavaScript/HTTP errors in Chrome DevTools.

### Out of Scope
- Performance / Load testing.
- Penetration / Security testing.
- Real payment gateway integration (not implemented in the demo environment).

## 3. Test Types & Techniques
- **Smoke Testing:** Critical path verification (Login -> Add to Cart -> Checkout).
- **Functional Testing:** Positive and negative scenarios using Equivalence Partitioning and Boundary Value Analysis.
- **UI / Visual Testing:** Layout alignment, image rendering, button states.
- **Cross-Browser Testing:** Google Chrome and Safari (latest stable versions).

## 4. Test Environment
- **OS:** macOS / Windows 11
- **Browsers:** Google Chrome (Desktop & DevTools Mobile Emulation), Safari
- **Tools:** Chrome DevTools (Elements, Console, Network), Jira (bug tracking format)

## 5. Entry & Exit Criteria
- **Entry Criteria:** Demo environment is reachable (HTTP 200), test accounts are available, and checklists/test cases are prepared.
- **Exit Criteria:** 100% of planned test cases executed, all Critical/High defects logged with clear reproduction steps and expected vs. actual results.

## 6. Risks & Mitigation
- **Demo Reset Behavior:** Browser state resets on logout or hard reload -> execute each test case from a clean session.
- **Special Test Accounts:** Accounts such as `problem_user` intentionally contain UI/sorting defects -> clearly document the exact account used in every bug report.

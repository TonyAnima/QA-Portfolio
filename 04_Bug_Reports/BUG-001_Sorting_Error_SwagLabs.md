# BUG-001: Product sorting dropdown does not reorder items for `problem_user`

| Field | Details |
| :--- | :--- |
| **Bug ID** | BUG-001 |
| **Severity** | Medium |
| **Priority** | Medium |
| **Status** | Open |
| **Environment** | Chrome 131 (macOS), Desktop 1440×900 |
| **URL** | [https://www.saucedemo.com/inventory.html](https://www.saucedemo.com/) |
| **Test Account** | `problem_user` / `secret_sauce` |
| **Related Test Case** | `TC-014` |

## Preconditions
User is logged in as `problem_user` and located on the Inventory page (`/inventory.html`).

## Steps to Reproduce
1. Locate the product sorting dropdown in the top-right corner (default: `Name (A to Z)`).
2. Click the dropdown and select `Price (low to high)`.
3. Observe the product cards order on the page.
4. Repeat with `Name (Z to A)` and `Price (high to low)`.

## Expected Result
Products should dynamically reorder according to the selected filter (e.g., `$7.99` Sauce Labs Onesie appears first when sorting by `Price (low to high)`).

## Actual Result
The dropdown selection resets/fails to trigger sorting, and the product list remains frozen in the default order.

## DevTools Notes
- **Network tab:** No failed HTTP requests (sorting is client-side).
- **Impact:** Users cannot filter products by price or name, reducing catalog usability.

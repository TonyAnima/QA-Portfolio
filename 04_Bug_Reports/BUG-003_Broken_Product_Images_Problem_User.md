# BUG-003: All catalog items display identical incorrect image for `problem_user`

| Field | Details |
| :--- | :--- |
| **Bug ID** | BUG-003 |
| **Severity** | Medium |
| **Priority** | High |
| **Status** | Open |
| **Environment** | Chrome 131 (macOS), Desktop 1440×900 |
| **URL** | [https://www.saucedemo.com/inventory.html](https://www.saucedemo.com/) |
| **Test Account** | `problem_user` / `secret_sauce` |
| **Related Test Case** | `TC-015` |

## Preconditions
User is logged in as `problem_user` on `/inventory.html`.

## Steps to Reproduce
1. Open the Inventory catalog page.
2. Visually inspect all 6 product thumbnails.
3. Right-click a product image -> `Inspect` (Chrome DevTools -> Elements tab) and check the `<img src="...">` attribute.

## Expected Result
Each product should display its own unique, matching product photo (Backpack, Bike Light, Bolt T-Shirt, Fleece Jacket, Onesie, Red T-Shirt).

## Actual Result
Every product card renders the same mismatched placeholder image (`/static/media/sl-404...jpg`) instead of the actual product photos.

## DevTools Notes
- **Elements tab:** All 6 `<img>` tags reference the same `sl-404` asset URL.
- **Visual QA Impact:** Severe visual defect affecting customer trust and conversion on an e-commerce storefront.
